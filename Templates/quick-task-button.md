<%*
// Quick Task — prompts for a task and appends it to Tasks.md.
// Invoked via Buttons plugin: type template note(_qt-stub, false) + templater true.
// The entry stub created by Buttons is deleted at the end (no note is left behind).

const tasksPath = "Tasks.md";

const taskInput = await tp.system.prompt("New task:");
const task = taskInput ? taskInput.trim() : "";

if (task) {
    // Optional one-click due date (powers the Overdue / Due today queries on Home).
    const dueLabels = ["— No date", "Today", "Tomorrow", "In 3 days", "Next week"];
    const dueOffsets = [null, 0, 1, 3, 7];
    const pick = await tp.system.suggester(dueLabels, dueOffsets, false, "Due date (Esc to skip):");

    let line = `- [ ] ${task}`;
    if (pick !== null && pick !== undefined) {
        line += ` 📅 ${tp.date.now("YYYY-MM-DD", pick)}`;
    }

    const tasksFile = app.vault.getAbstractFileByPath(tasksPath);
    if (tasksFile) {
        const content = await app.vault.read(tasksFile);
        await app.vault.modify(tasksFile, content.replace(/\s+$/, "") + "\n" + line + "\n");
        new Notice(`Added to Tasks: ${task}`, 2500);
    } else {
        new Notice(`Couldn't find ${tasksPath}`, 4000);
    }
}

// Cleanup: delete the Buttons-plugin entry stub so no orphan note is left.
const stub = tp.config.target_file;
if (stub && stub.path !== tasksPath) {
    await app.vault.delete(stub);
}
%>
