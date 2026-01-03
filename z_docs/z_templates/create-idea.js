<%*
// Create Idea Script
// Prompts for idea name and creates folder structure

const ideaName = await tp.system.prompt("Enter idea name:");
if (!ideaName) {
    return;
}

// Normalize idea name
const normalizedName = ideaName.trim();
const ideaTag = normalizedName.toLowerCase().replace(/[^a-z0-9]/g, "");
const ideaFileName = `💡 ${normalizedName}.md`;

// Create folder path
const ideasFolder = "002. Ideas";
const ideaFolder = `${ideasFolder}/💡 ${normalizedName}`;
const ideaFilePath = `${ideaFolder}/${ideaFileName}`;

// Check if folder already exists
const folderExists = await app.vault.adapter.exists(ideaFolder);
if (folderExists) {
    new Notice(`Idea folder "${normalizedName}" already exists!`, 3000);
    return;
}

// Create folder
await app.vault.createFolder(ideaFolder);

// Read template
const templatePath = "z_docs/z_templates/idea-home.md";
const template = await app.vault.adapter.read(templatePath);

// Process template with Templater
const processed = await tp.file.templater(template, {
    ideaName: normalizedName,
    ideaTag: ideaTag
});

// Create the idea file
await app.vault.create(ideaFilePath, processed);

// Open the new file
const file = app.vault.getAbstractFileByPath(ideaFilePath);
if (file) {
    await app.workspace.openLinkText(ideaFilePath, "", true);
    new Notice(`Created idea: ${normalizedName}`, 2000);
}
%>

