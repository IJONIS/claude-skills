---
name: agent-triage
description: Priority 0 routing — check agent registry BEFORE any skill invocation. Fires before brainstorming, debugging, or any superpowers skill.
---

<EXTREMELY-IMPORTANT>
This overrides the superpowers skill priority chain. The full order is now:

0. **Agent triage** (THIS) — route to a registered agent if one matches
1. Process skills (brainstorming, debugging)
2. Implementation skills (frontend-design, etc.)

You MUST complete agent triage BEFORE invoking any other skill.
</EXTREMELY-IMPORTANT>

## The Rule

Before checking if any skill applies, check if a **registered agent** should own this task instead of you.

## Registered Agents

{{AGENT_REGISTRY}}

## Routing Flow

1. Read the user's task
2. Match against the registered agent descriptions above
3. **If an agent's domain covers the task** → infer the mode from the message:

### Mode Inference

| Signal in user's message | Mode | Example |
|--------------------------|------|---------|
| Conversational / iterative ("help me", "let's draft", "review this with me", "work on") | **Interactive** | "Help me write a LinkedIn post" |
| Fire-and-forget / self-contained ("write a", "create a", "generate", "make a") | **Subagent** | "Write me a LinkedIn post about X" |
| Ambiguous or unclear | **Ask the user** | "LinkedIn post" (no verb cue) |

### After inferring mode

- **Interactive**: Announce the agent and invoke its skill. The user can say "stop" or redirect to exit the agent's persona.
- **Subagent**: State your assumptions for all decisions the agent would normally ask about (e.g., author, language, mode, tone) and let the user override before dispatching. Then dispatch and relay results.
- **Ask**: Present both options briefly and let the user choose.

4. **If no agent matches** → proceed to superpowers skill chain as normal (check for brainstorming, debugging, implementation skills, etc.)

## Important

- This check applies to EVERY task, including ones you think are simple
- Agent descriptions are the source of truth for domain matching
- When in doubt about the agent match, ask rather than skipping triage
- When in doubt about the mode, default to subagent (less intrusive)
- Multiple agents may match — present the best fit, mention alternatives
