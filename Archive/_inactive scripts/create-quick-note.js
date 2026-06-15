<%*
// Create Quick Note Script
// Prompts for note title and tags

// Prompt for note title (optional)
const titleInput = await tp.system.prompt("Enter note title (optional, leave blank for 'quick note'):");
const title = titleInput ? titleInput.trim() : "quick note";

// Prompt for tags (optional)
const tagsInput = await tp.system.prompt("Enter tags (comma-separated, optional, e.g., 'x2,compbio'):");
const tags = tagsInput ? tagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

// Generate file name
const dateStr = tp.date.now("YYYY-MM-DD");
const fileName = `${dateStr} ${title}.md`;

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
tags:
  - quick
`;
tags.forEach(tag => {
    frontmatter += `  - ${tag}\n`;
});
frontmatter += `Follow up:
---

`;

// Build content
const content = frontmatter + `### 🧠 Note


`;

// Create the note
await app.vault.create(filePath, content);

// Open the new file
const file = app.vault.getAbstractFileByPath(filePath);
if (file) {
    await app.workspace.openLinkText(filePath, "", true);
    new Notice(`Created quick note: ${fileName}`, 2000);
}
%>

