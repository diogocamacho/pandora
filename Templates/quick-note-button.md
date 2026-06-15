<%*
// Quick Note — prompts for title and tags, creates note in Notes/.
// Designed to be invoked via Buttons plugin: type note(_qn-stub, false) + templater true.
// The entry stub created by Buttons is deleted at the end.

const titleInput = await tp.system.prompt("Note title (optional, blank → 'quick note'):");
const title = titleInput ? titleInput.trim() : "quick note";

const tagsInput = await tp.system.prompt("Tags (comma-separated, optional, e.g., 'x2,compbio'):");
const tags = tagsInput ? tagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

const dateStr = tp.date.now("YYYY-MM-DD");
const fileName = `${dateStr} ${title}.md`;
const filePath = `Notes/${fileName}`;

const exists = await app.vault.adapter.exists(filePath);
if (!exists) {
    let frontmatter = `---\ntags:\n  - quick\n`;
    tags.forEach(t => { frontmatter += `  - ${t}\n`; });
    frontmatter += `Follow up:\n---\n\n`;
    const content = frontmatter + `### 🧠 Note\n\n\n`;
    await app.vault.create(filePath, content);
    await app.workspace.openLinkText(filePath, "", true);
    new Notice(`Created: ${fileName}`, 2000);
} else {
    new Notice(`"${fileName}" already exists`, 3000);
    await app.workspace.openLinkText(filePath, "", true);
}

// Cleanup: delete the Buttons-plugin entry stub.
const stub = tp.config.target_file;
if (stub && stub.path !== filePath) {
    await app.vault.delete(stub);
}
%>
