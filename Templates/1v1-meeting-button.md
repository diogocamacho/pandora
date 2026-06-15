<%*
// 1:1 Meeting Note — prompts for person + tags, creates note in Notes/, links into today's daily.
// Invoked via Buttons plugin: type note(_1v1-stub, false) + templater true.

const personTagMap = {
    "andrew": "acroneberger", "andrew croneberger": "acroneberger",
    "beth": "bkartchner", "beth kartchner": "bkartchner",
    "jeremy": "jamon", "jeremy amon": "jamon",
    "nitya": "ntalasila", "nitya talasila": "ntalasila",
    "carl": "cmagnone", "carl magnone": "cmagnone"
};
function getPersonTag(name) {
    const n = name.toLowerCase().trim();
    return personTagMap[n] || n.replace(/\s+/g, "").replace(/[^a-z0-9]/g, "");
}

const personInput = await tp.system.prompt("Person name(s) (e.g., 'Andrew' or 'Andrew <> Diogo'):");
if (personInput) {
    const personNames = personInput.split("<>").map(s => s.trim()).filter(s => s);
    const primary = personNames[0];
    const personTag = getPersonTag(primary);

    const projectTagsInput = await tp.system.prompt("Project tags (comma-separated, optional):");
    const projectTags = projectTagsInput ? projectTagsInput.split(",").map(t => t.trim()).filter(t => t) : [];

    const dateStr = tp.date.now("YYYY-MM-DD");
    const fileName = personNames.length > 1
        ? `${dateStr} ${personNames.join(" <> ")}.md`
        : `${dateStr} ${primary} <> Diogo.md`;
    const filePath = `Notes/${fileName}`;

    const exists = await app.vault.adapter.exists(filePath);
    if (!exists) {
        let frontmatter = `---\nFollow up:\ntags:\n  - 1v1\n  - ${personTag}\n`;
        projectTags.forEach(t => { frontmatter += `  - ${t}\n`; });
        frontmatter += `---\n\n`;

        const content = frontmatter +
`---
## 💬 To discuss

### Asks and tasks

> [!check] Tasks
> \`\`\`tasks
> not done
> tags include ${personTag}
> \`\`\`

> [!note] Previous notes
> \`\`\`dataview
> LIST
> FROM #${personTag}
> WHERE follow-up = true OR file.ctime > (date(now) - dur(7 days))
> \`\`\`

---
## ✍️ Notes and action items

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
        new Notice(`Created 1:1: ${fileName}`, 2000);
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
