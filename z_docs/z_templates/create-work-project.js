<%*
// Create Work Project Script
// Prompts for project name and creates folder structure

const projectName = await tp.system.prompt("Enter project name:");
if (!projectName) {
    return;
}

// Normalize project name for folder/file names
const normalizedName = projectName.replace(/[^a-zA-Z0-9\s]/g, "").trim();
const projectTag = normalizedName.toLowerCase().replace(/\s+/g, "").replace(/[^a-z0-9]/g, "");

// Create folder path
const workFolder = "001. Work";
const projectFolder = `${workFolder}/${normalizedName}`;
const homeFileName = `${normalizedName} Home.md`;
const homeFilePath = `${projectFolder}/${homeFileName}`;

// Check if folder already exists
const folderExists = await app.vault.adapter.exists(projectFolder);
if (folderExists) {
    new Notice(`Project folder "${normalizedName}" already exists!`, 3000);
    return;
}

// Create folder
await app.vault.createFolder(projectFolder);

// Read template
const templatePath = "z_docs/z_templates/work-project-home.md";
const template = await app.vault.adapter.read(templatePath);

// Process template with Templater
const processed = await tp.file.templater(template, {
    projectName: normalizedName,
    projectTag: projectTag
});

// Create the home file
await app.vault.create(homeFilePath, processed);

// Open the new file
const file = app.vault.getAbstractFileByPath(homeFilePath);
if (file) {
    await app.workspace.openLinkText(homeFilePath, "", true);
    new Notice(`Created project: ${normalizedName}`, 2000);
}
%>

