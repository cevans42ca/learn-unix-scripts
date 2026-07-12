# Guide for LLMs: Writing New Material for Learn-Unix-Scripts

This guide outlines the tone, structure, and technical requirements for creating new educational content for the `learn-unix-scripts` project.

## 1. Tone and Voice

### Respectful and Encouraging
- **Treat the learner as a peer**: Never be condescending. Use a tone that is helpful and patient.
- **Encourage exploration**: Use phrases like "Feel free to check your notes" or "It's important that you have a full understanding".
- **Handle failure gracefully**: If a check fails, use encouraging messages (e.g., "Better luck next time", "Try again").

### Martial Arts Analogy
- The course uses a "belt" progression (White, Yellow, Green, Blue, Red, Black).
- Belts and stripes represent even progression, so going from white belt to yellow stripe versus yellow stripe to yellow belt are both one level of progress.
- Use this analogy to frame progress: "Congratulations! You have now attained your [Belt Color]."

### Analogies and Clarity
- **Use analogies for complex concepts**: For example, the kernel is a "personal assistant" to the hardware, and the CPU is hardware that "can't easily be changed."
- **Provide context**: Explain *why* something is the way it is (e.g., the history of `Ctrl+l` coming from printers).
- **Relate to known systems**: Briefly reference Windows or macOS behavior if it helps clarify a concept, but don't require knowledge of them.

## 2. Content Structure

### The "Learn" Phase (`learn-master`)
Each exercise should follow this general pattern:
1.  **Welcome/Introduction**: Briefly state what will be covered.
2.  **Instructional Text**: Use `fmt` for dynamic wrapping.
    ```bash
    fmt ${FMT_OPTIONS:-}$WIDTH <<EOL >> $fmt_file
    Your educational text goes here.
    EOL
    ```
3.  **Code Examples**: Use `cat` for raw terminal output to avoid wrapping.
    ```bash
    cat <<EOL >> $fmt_file
    user@host [~]# command --option
    output results
    EOL
    ```
4.  **Action Item**: Explicitly tell the user what to do (e.g., "Execute 'type ls'.").
5.  **Completion**: Call `complete_exercise`.

### The "Check" Phase (`checkmain-master`)
Verification can take several forms:
- **Command History**: Check if the user executed a specific command by inspecting `luc_history`.
- **Quizzes**: Use `handle_answer` with a list of options.
- **Environment Checks**: Verify files created, permissions changed, etc.
- **Passive Progress**: Use `keep_going` if the exercise was just reading.

## 3. Technical Guidelines

### Shell Compatibility
- **Bash 4.0+**: Use associative arrays for exercise mapping.
- **Dynamic Width**: Always use `$WIDTH` (in `learn`) or `$luc_width` (in `check`) with `fmt`.
- **Standard Utilities**: Stick to common Unix tools (`grep`, `sed`, `awk`, `perl`, `stty`).

### Replacement System
- **Never modify `dist/bin`**: Only edit `*-master` files.
- **GUID Markers**: Use `# insert <GUID>` or `# replace start <GUID>` / `# replace end <GUID>` for site-specific or shared logic.
- **Common Logic**: Shared belt definitions and ranks reside in `main/replacements/common-replace`.

### File Organization and Vim Folds
- **Vim Folds**: Master scripts are organized using Vim folds (e.g., `# Section Name (Start vim fold) {{{` and `# (End vim fold) }}}` or just `# }}}`).
- **Respect Boundaries**: When adding or modifying code, ensure you stay within the appropriate fold and never delete or malform the fold markers.
- **Maintain Structure**: If you create a new section that is large, consider wrapping it in a Vim fold to maintain consistency with the rest of the project.

### Exercise Mapping
New exercises must be added to the `exercises` associative array in `common-replace` under the appropriate belt:
```bash
exercises["belt_name_$((i++))"]="exercise_name"
```
The function name in the master scripts should then follow the pattern `belt_name_exercise_exercise_name` (e.g., `green_belt_exercise_ctrl_c`). Note that for some belts, the prefix might vary slightly (e.g., `white_belt_exercise_` vs `yellow_stripe_exercise_`). Check `common-replace` and existing functions in `learn-master` for the exact prefix used for each belt.

## 4. Summary Checklist for LLMs
- [ ] Is the tone encouraging and respectful?
- [ ] Did I use an analogy for challenging concepts?
- [ ] Is all text wrapped using `fmt` with the dynamic width variable?
- [ ] Did I add the exercise to `common-replace`?
- [ ] Did I implement both the `learn` function and the `check` function?
- [ ] Does it work on Bash 4.0?
- [ ] Did I respect and maintain all Vim fold markers (`{{{`, `}}}`)?
