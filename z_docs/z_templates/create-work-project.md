Creating work project...
<%*
// Create Work Project Script
// Prompts for project name and creates folder structure

const projectName = await tp.system.prompt("Enter project name:");
if (!projectName) {
    tR = "Cancelled"; // Return content if cancelled
} else {
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
        tR = "Project already exists"; // Return content
    } else {
        // Create folder
        await app.vault.createFolder(projectFolder);

        // Read template
        const templatePath = "z_docs/z_templates/work-project-home.md";
        const templateFile = app.vault.getAbstractFileByPath(templatePath);
        if (!templateFile) {
            new Notice(`Template not found: ${templatePath}`, 3000);
            tR = "Template not found"; // Return content
        } else {
            const template = await app.vault.read(templateFile);

            // Replace Templater placeholders with actual values
            let processed = template;
            // Replace the complex Templater expression with the project tag
            const templaterPattern = /<% tp\.file\.title\.replace\([^)]+\)\.toLowerCase\(\)\.replace\([^)]+\) %>/g;
            processed = processed.replace(templaterPattern, projectTag);

            // Create the home file
            await app.vault.create(homeFilePath, processed);

            // Delete the temporary note that was created
            const targetFile = tp.config.target_file;
            if (targetFile) {
                await app.vault.delete(targetFile);
            }

            // Open the new file
            const file = app.vault.getAbstractFileByPath(homeFilePath);
            if (file) {
                await app.workspace.openLinkText(homeFilePath, "", true);
                new Notice(`Created project: ${normalizedName}`, 2000);
            }
            
            // Delete this temporary note after a short delay
            setTimeout(async () => {
                const targetFile = tp.config.target_file;
                if (targetFile && targetFile.path !== homeFilePath) {
                    await app.vault.delete(targetFile);
                }
            }, 100);
            
            tR = `Project "${normalizedName}" created successfully!`; // Return content
        }
    }
}
%>
