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
3. **If an agent's domain covers the task** → ask the user:
   - **Interactive**: agent takes over via its skill
   - **Subagent**: you dispatch autonomously, relay results
   - If subagent: list all decisions the agent would normally ask about and state your assumptions. Let the user override before dispatching.
4. **If no agent matches** → proceed to superpowers skill chain as normal (check for brainstorming, debugging, implementation skills, etc.)

## Important

- This check applies to EVERY task, including ones you think are simple
- Agent descriptions are the source of truth for domain matching
- When in doubt, ask the user rather than skipping triage
- Multiple agents may match — present the best fit, mention alternatives
