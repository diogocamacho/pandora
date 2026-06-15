<%*
// Create Regular Meeting Note Script
// Prompts for meeting name, project tags, and people

// Prompt for meeting name
const meetingName = await tp.system.prompt("Enter meeting name:");
if (!meetingName) {
    return;
}

// Prompt for project tags (optional)
const projectTagsInput = await tp.system.prompt("Enter project tags (comma-separated, optional, e.g., 'abiologics,pbu'):");
const projectTags = projectTagsInput ? projectTagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

// Prompt for people (optional)
const peopleInput = await tp.system.prompt("Enter people (comma-separated, optional):");
const people = peopleInput ? peopleInput.split(",").map(p => p.trim()).filter(p => p) : [];

// Generate file name
const dateStr = tp.date.now("YYYY-MM-DD");
const fileName = `${dateStr} ${meetingName}.md`;

// Create note path
const notesFolder = "Notes";
const filePath = `${notesFolder}/${fileName}`;

// Check if file already exists
const fileExists = await app.vault.adapter.exists(filePath);
if (fileExists) {
    new Notice(`Note "${fileName}" already exists!`, 3000);
    return;
}

// Build frontmatter
let frontmatter = `---
`;
if (people.length > 0) {
    frontmatter += `People:\n`;
    people.forEach(person => {
        frontmatter += `  - ${person}\n`;
    });
}
frontmatter += `tags:\n`;
projectTags.forEach(tag => {
    frontmatter += `  - ${tag}\n`;
});
frontmatter += `Follow up:\n---\n\n`;

// Build content
const content = frontmatter + `---
## 🗓️ Agenda 
*What are we talking about today?*


## ✍️ Notes and Action Items
*Things that we talked about*

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
    new Notice(`Created meeting note: ${fileName}`, 2000);
}
%>
