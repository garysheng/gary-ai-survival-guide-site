---
title: "SwitchBooks"
---

# SwitchBooks: Replacing QuickBooks with an Agentic Alternative

Ryland hated QuickBooks. That's the whole origin story.

He runs a national accounting firm he started seven years ago. About 700 clients, all on QuickBooks. And every day he'd open QuickBooks and feel the friction. The interface that made simple things complicated. The workflows that required twelve clicks when they should have required two. The disconnect between what his clients actually needed and what the software forced them to do. For years, he suppressed the irritation the way most professionals do: by getting on with it.

Then, about two years ago, he decided to stop suppressing it. He decided to rebuild QuickBooks from scratch.

The result is SwitchBooks, which Ryland describes as "ChatGPT and QuickBooks had a baby." It's live. Real clients are using it. And it works fundamentally differently from anything else in the accounting world.

## The Interface Nobody Expected

There's no traditional dashboard. No nested menu structures. No "go to Reports, then Profit and Loss, then select date range, then export." Instead, there's a chat bar. You type what you want. "Pull my PNL for Q4." "Create a new vendor called Acme Supply." "Reconcile my checking account." The AI figures out what you need and does it.

Behind that simple interface is something genuinely elegant: atomic tool calling. Every accounting action (pull a report, create a vendor, run a reconciliation) is one discrete, atomic tool. The AI determines which tools to call and in what order. Then it checks its own work. Each tool returns success or failure. If something fails, the system loops until it gets it right, then reports back to the user. The user sees none of the complexity. They just say what they want, and it gets done.

This is the Iron Man suit in action. Ryland is still the accountant. His expertise, his judgment, his relationships with 700 clients: none of that got replaced. But now he operates through a layer of AI that handles the mechanical execution. He went from being an accountant who fights his software to an accountant whose software fights for him.

## The 100,000 Lines Lesson

Here's the part that still makes me shake my head. Ryland's first version of the agent code was 100,000 lines. It tried to account for every possible user input, every edge case, every conceivable path through the system. It was the engineering equivalent of trying to predict every conversation a human might have and pre-scripting the responses.

Then he stripped it down to 200 lines. And it performed, in his words, "literally a thousand times better."

The bloated version tried to do the AI's job for it. The lean version gave the AI a finite set of rules and let it reason. Ryland put it this way: "No one wants to be overloaded with information. What people want is a finite set of rules. And then they want to use their reasoning on their own." He was talking about AI, but the principle applies equally to humans.

This is the dictator of truth concept playing out in real architecture. Ryland didn't try to control every decision the AI makes. He defined the truth (what each tool does, what success and failure look like, what the rules of accounting are) and then let the AI reason within those boundaries. Tight on truth, loose on execution.

## The Autonomy Slider

SwitchBooks includes what Ryland calls an autonomy slider. The user controls whether the AI agent runs autonomously (like a heartbeat, continuously monitoring and acting) or waits for their command. This is a small design choice that reflects a deep insight: different clients have different comfort levels, and the system should adapt to the human, not the other way around.

Some clients want the AI to handle everything and just surface what matters. Others want to stay in the loop on every action. Both are valid. The slider honors that without requiring two different products.

## The Vertical Leap

What makes Ryland's story remarkable is the trajectory. He started as a practitioner (an accountant running an accounting firm). He didn't bring in outside engineers to build his vision. He became the builder. He went from someone who uses accounting software to someone who is redefining what accounting software can be. That's the vertical leap: from practitioner to industry paradigm-shifter.

His stated goal makes the ambition clear: "My goal is to completely make bookkeeping autonomous." Not semi-autonomous. Not AI-assisted. Autonomous. He's building toward a self-improving business where the system handles bookkeeping end to end, learning and adapting as it goes.

And he proved the concept on his own firm first. Seven hundred clients. Real money. Real stakes. He didn't build a demo and go looking for customers. He built it for himself, validated it in the harshest possible testing environment (his own livelihood), and is now scaling from that foundation.

## What SwitchBooks Teaches Us

Ryland's story crystallizes several things I keep seeing in the most effective AI builders:

The annoyance was the roadmap. He hated QuickBooks. He didn't suppress that. He channeled it into a product that solves every friction point he experienced firsthand. Your frustration is data.

Less chatbot, more agent. Ryland's phrase was "less chatbots, more power, more agents." The chat bar isn't there to have conversations. It's there to get things done. The AI isn't pretending to be a person. It's a tool that happens to understand natural language.

Strategy is the moat. "It's your strategy that you embed in the system." The AI is powerful, but it's Ryland's seven years of accounting expertise that makes SwitchBooks actually work for real clients. The AI is the tool. The domain knowledge is the identity.

I believe stories like Ryland's are a sign of what the Holy Spirit is doing in this season: giving ordinary practitioners the capacity to reimagine entire industries. Not through credentials or connections, but through the combination of deep domain knowledge and a willingness to build. That combination is now sufficient. It didn't used to be. It is now.

## Related

- [[the-iron-man-suit]] - Ryland is the augmented accountant
- [[vertical-leap]] - From practitioner to industry paradigm-shifter
- [[industry-two-point-oh]] - "My goal is to completely make bookkeeping autonomous"
- [[be-easily-annoyed]] - Hating QuickBooks became the product roadmap
- [[n-equals-one-then-scale]] - Proved it on his own 700 clients first
- [[the-dictator-of-truth]] - "It's your strategy that you embed in the system"
- [[ai-as-tool-not-identity]] - "Less chatbots, more power, more agents"
- [[self-improving-business]] - The north star: fully autonomous bookkeeping
