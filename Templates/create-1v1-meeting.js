<%*
// Create 1:1 Meeting Note Script
// Prompts for person name and project tags, creates note with proper tagging

// Person tag mapping - converts names to tag format
const personTagMap = {
    "andrew": "acroneberger",
    "andrew croneberger": "acroneberger",
    "beth": "bkartchner",
    "beth kartchner": "bkartchner",
    "jeremy": "jamon",
    "jeremy amon": "jamon",
    "nitya": "ntalasila",
    "nitya talasila": "ntalasila",
    "carl": "cmagnone",
    "carl magnone": "cmagnone"
};

function getPersonTag(name) {
    const normalized = name.toLowerCase().trim();
    return personTagMap[normalized] || normalized.replace(/\s+/g, "").replace(/[^a-z0-9]/g, "");
}

// Prompt for person name(s)
const personInput = await tp.system.prompt("Enter person name(s) (e.g., 'Andrew' or 'Andrew <> Diogo'):");
if (!personInput) {
    return;
}

// Parse person names
const personNames = personInput.split("<>").map(n => n.trim()).filter(n => n);
const primaryPerson = personNames[0];
const personTag = getPersonTag(primaryPerson);

// Prompt for project tags (optional)
const projectTagsInput = await tp.system.prompt("Enter project tags (comma-separated, optional, e.g., 'abiologics,compbio'):");
const projectTags = projectTagsInput ? projectTagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

// Generate file name
const dateStr = tp.date.now("YYYY-MM-DD");
let fileName;
if (personNames.length > 1) {
    fileName = `${dateStr} ${personNames.join(" <> ")}.md`;
} else {
    fileName = `${dateStr} ${primaryPerson} <> Diogo.md`;
}

// Create note path
const notesFolder = "Notes";
const filePath = `${notesFolder}/${fileName}`;

// Check if file already exists
const fileExists = await app.vault.adapter.exists(filePath);
if (fileExists) {
    new Notice(`Note "${fileName}" already exists!`, 3000);
    return;
}

// Build tags array
const tags = ["1v1", personTag, ...projectTags];

// Build frontmatter
let frontmatter = `---
Follow up:
tags:
  - 1v1
  - ${personTag}
`;
projectTags.forEach(tag => {
    frontmatter += `  - ${tag}\n`;
});
frontmatter += `---\n\n`;

// Build content with person tag in Dataview queries
const content = frontmatter + `---
## 💬 To Discuss

### Asks and Tasks

> [!check] Tasks
> \`\`\`dataview
> task
> FROM #${personTag} 
> WHERE !completed
> \`\`\` 
>


> [!NOTE] Previous notes
> \`\`\`dataview
> LIST
> FROM #${personTag} 
> WHERE follow-up = true | file.ctime > (date(now) - dur(7 days))
> \`\`\` 
>


---
## ✍️ Notes and Action Items

`;

// Create the note
await app.vault.create(filePath, content);

// Update daily note
const dailyNotePath = `Dailies/${dateStr}.md`;
const dailyNote = app.vault.getAbstractFileByPath(dailyNotePath);
if (dailyNote) {
    const dailyContent = await app.vault.read(dailyNote);
    const linkText = `- [[${fileName.replace(".md", "")}]]`;
    
    // Find the "Meetings for the day" section and add link
    const meetingsSection = /## Meetings for the day[\s\S]*?(?=##|$)/;
    const match = dailyContent.match(meetingsSection);
    
    if (match) {
        const sectionContent = match[0];
        // Check if link already exists
        if (!sectionContent.includes(fileName.replace(".md", ""))) {
            // Add link before the closing of the section
            const updatedSection = sectionContent.replace(/(\n- \[\[\.\.\.\]\])/g, `\n${linkText}$1`);
            const updatedContent = dailyContent.replace(meetingsSection, updatedSection);
            await app.vault.modify(dailyNote, updatedContent);
        }
    }
}

// Open the new file
const file = app.vault.getAbstractFileByPath(filePath);
if (file) {
    await app.workspace.openLinkText(filePath, "", true);
    new Notice(`Created 1:1 meeting note: ${fileName}`, 2000);
}
%>

