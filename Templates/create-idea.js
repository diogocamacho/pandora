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
const templateFile = app.vault.getAbstractFileByPath(templatePath);
if (!templateFile) {
    new Notice(`Template not found: ${templatePath}`, 3000);
    return;
}

const template = await app.vault.read(templateFile);

// Replace placeholders in template
let processed = template;
// Replace Templater variables
processed = processed.replace(/<% tp\.date\.now\("YYYY-MM-DD"\) %>/g, tp.date.now("YYYY-MM-DD"));
// Replace the complex Templater expression with the idea tag
const templaterPattern = /<% tp\.file\.title\.replace\([^)]+\)\.toLowerCase\(\)\.replace\([^)]+\) %>/g;
processed = processed.replace(templaterPattern, ideaTag);

// Create the idea file
await app.vault.create(ideaFilePath, processed);

// Open the new file
const file = app.vault.getAbstractFileByPath(ideaFilePath);
if (file) {
    await app.workspace.openLinkText(ideaFilePath, "", true);
    new Notice(`Created idea: ${normalizedName}`, 2000);
}
%>

