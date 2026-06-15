<%*
// Meeting Note — prompts for name + tags + people, creates note in Notes/, links into today's daily.
// Invoked via Buttons plugin: type note(_mt-stub, false) + templater true.

const meetingName = await tp.system.prompt("Meeting name:");
if (meetingName) {
    const projectTagsInput = await tp.system.prompt("Project tags (comma-separated, optional, e.g. 'abiologics,pbu'):");
    const projectTags = projectTagsInput ? projectTagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

    const peopleInput = await tp.system.prompt("People (comma-separated, optional):");
    const people = peopleInput ? peopleInput.split(",").map(p => p.trim()).filter(p => p) : [];

    const dateStr = tp.date.now("YYYY-MM-DD");
    const fileName = `${dateStr} ${meetingName}.md`;
    const filePath = `Notes/${fileName}`;

    const exists = await app.vault.adapter.exists(filePath);
    if (!exists) {
        let frontmatter = `---\n`;
        if (people.length > 0) {
            frontmatter += `People:\n`;
            people.forEach(p => { frontmatter += `  - ${p}\n`; });
        }
        frontmatter += `tags:\n`;
        projectTags.forEach(t => { frontmatter += `  - ${t}\n`; });
        frontmatter += `Follow up:\n---\n\n`;

        const content = frontmatter +
`---
## 🗓️ Agenda
*What are we talking about today?*


## ✍️ Notes and action items
*Things that we talked about*

`;
        await app.vault.create(filePath, content);

        // Append link to today's daily, if it exists.
        const dailyPath = `Notes/${dateStr}.md`;
        const daily = app.vault.getAbstractFileByPath(dailyPath);
        if (daily) {
            const dailyContent = await app.vault.read(daily);
            const link = `- [[${fileName.replace(".md", "")}]]`;
            if (!dailyContent.includes(fileName.replace(".md", ""))) {
                const meetingsRe = /## 📝 Meetings[\s\S]*?(?=\n## |\n---|\Z)/;
                const m = dailyContent.match(meetingsRe);
                if (m) {
                    const updated = m[0].replace(/(- \[\[\]\])/, `${link}\n$1`);
                    await app.vault.modify(daily, dailyContent.replace(meetingsRe, updated));
                }
            }
        }

        await app.workspace.openLinkText(filePath, "", true);
        new Notice(`Created meeting: ${fileName}`, 2000);
    } else {
        new Notice(`"${fileName}" already exists`, 3000);
        await app.workspace.openLinkText(filePath, "", true);
    }
}

// Cleanup: delete the Buttons-plugin entry stub.
const stub = tp.config.target_file;
if (stub) {
    const stubStillThere = app.vault.getAbstractFileByPath(stub.path);
    if (stubStillThere) await app.vault.delete(stubStillThere);
}
%>
