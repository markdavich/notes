# Prompt Engineering

## ✨ Prompt Engineering Essentials  

> Struggling to get useful responses from AI models? This prompt engineering tutorial  
> covers everything developers need to know for effective LLM interactions. Learn how  
> to think about context and tokens, structure your requests, and overcome common  
> prompt issues. Perfect for anyone looking to leverage AI more effectively in their  
> development workflow.

------------------------------------------------------------------------

## Prompts

A **prompt** is simply what you ask Copilot.

It can be:
- A question  
- An instruction  
- A description of a problem  
- Or a mix of all three  

**Think of it like:**  
Talking to a new coworker. The clearer you explain what you want, the better the help you’ll get.

Good prompts:
- Say what you want  
- Say why you want it  
- Say how you want it done  

------------------------------------------------------------------------

## LLMs Under the Hood

Copilot is powered by **Large Language Models (LLMs)** — systems trained to recognize
patterns in language and code so they can predict helpful responses.

### Context

**What it is:**  
The information Copilot can “see” when answering you — your question, your code, and
sometimes related files.

**Why it matters:**  
If Copilot doesn’t see it, it can’t use it.

**Think of it like:**  
Giving directions without telling someone where you are.

---

### Tokens

**What they are:**  
Small chunks of text that the AI reads — parts of words, symbols, or code.

**Why they matter:**  
There’s a limit to how much Copilot can read at once.

**Think of it like:**  
A sticky note. You only have so much space to write instructions.

---

### Limitations

**What they are:**  
Things Copilot simply can’t do perfectly.

Examples:
- It doesn’t truly “understand” — it predicts  
- It may miss hidden project rules  
- It can’t see your whole company history  

**Think of it like:**  
A very smart intern — helpful, fast, but still needs guidance.

---

### Hallucinations

**What they are:**  
When Copilot sounds confident but gives an answer that isn’t correct.

**Why it happens:**  
The model fills in gaps when it lacks enough information.

**Think of it like:**  
Someone guessing instead of admitting they don’t know.

---

### Training

**What it is:**  
Copilot learns from large collections of public code, documentation, and patterns —
not from your private conversations in real time.

**What it means for you:**  
It knows common practices, but not your company’s unwritten rules unless you tell it.

**Think of it like:**  
A well-read consultant who hasn’t worked at your company yet.

------------------------------------------------------------------------

## Prompt Engineering

Prompt engineering is **the skill of asking better questions** so Copilot can give
better answers.

### Clear and Precise

Say exactly what you want.

Instead of:  
> “Fix this.”

Try:  
> “Refactor this function to be easier to read and add comments explaining each step.”

**Think of it like:**  
Giving clear directions instead of pointing and hoping.

---

### Enough Context

Give Copilot the background it needs.

Add things like:
- The goal  
- The audience  
- The constraints  

Example:  
> “Explain this code for a non-technical project manager in simple terms.”

**Think of it like:**  
Telling someone not just *what* to do, but *why*.

---

### Iterate and Refine

Your first prompt doesn’t have to be perfect.

You can:
- Ask follow-up questions  
- Say “That’s close, but…”  
- Request a different tone or format  

**Think of it like:**  
A conversation, not a command.

---

### Summary

Good prompt engineering means:
- Being clear  
- Giving context  
- Refining as you go  

When you do this, Copilot becomes **far more useful and far less confusing**.

------------------------------------------------------------------------

## Unexpected Output (Common LLM Pitfalls)

Even with great tools, things can go wrong. Here’s how to recognize and fix common issues.

---

### Prompt Confusion  
**How to identify and resolve**

**What it looks like:**
- Copilot answers a different question than you asked  
- The response feels unrelated  
- It focuses on the wrong part of the problem  

**Why it happens:**
- The prompt was vague  
- Too many ideas in one request  

**How to fix it:**
- Break your request into smaller parts  
- Be specific about your goal  
- Restate the task clearly  

**Think of it like:**  
Rephrasing a question when someone misunderstands you.

---

### Token Limitations  
**How to identify and resolve**

**What it looks like:**
- Copilot forgets earlier details  
- Long files get partially ignored  
- Answers seem cut off  

**Why it happens:**
- Too much information at once  

**How to fix it:**
- Ask about one file at a time  
- Summarize instead of pasting everything  
- Use follow-up prompts to continue  

**Think of it like:**  
Breaking a long speech into smaller conversations.

---

### Assumption Errors  
**How to identify and resolve**

**What it looks like:**
- Copilot assumes tools, frameworks, or rules you don’t use  
- It suggests solutions that don’t fit your environment  

**Why it happens:**
- It defaults to common industry patterns  

**How to fix it:**
- State your constraints clearly  
- Say what you *don’t* use  
- Correct it and ask again  

Example:  
> “We don’t use Docker. Please suggest a solution without containers.”

**Think of it like:**  
Correcting someone who guessed wrong about your situation.

------------------------------------------------------------------------

## Summary

Prompt engineering isn’t about tricking AI —  
it’s about **communicating clearly with a powerful assistant**.

When you:
- Give good context  
- Ask precise questions  
- Expect to refine  
- Watch for common pitfalls  

You turn GitHub Copilot Enterprise into:
- A faster teacher  
- A better collaborator  
- And a more reliable productivity partner  

**In simple terms:**  
Better prompts = better results.
