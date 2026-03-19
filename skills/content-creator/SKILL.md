---
name: content-creator
description: Create SEO-optimized marketing content with consistent brand voice. Includes brand voice analyzer, content frameworks, social media templates, and keyword research workflows. Use when writing blog posts, creating social media content, analyzing brand voice, optimizing SEO, planning content calendars, or when user mentions content creation, brand voice, SEO optimization, social media marketing, or content strategy.
license: MIT
metadata:
  version: 2.0.0
  author: Alireza Rezvani
  category: marketing
  domain: content-marketing
  updated: 2026-02-21
  python-tools: brand_voice_analyzer.py
  tech-stack: SEO, social-media-platforms
---

# Content Creator

Professional-grade brand voice analysis, SEO content optimization, and platform-specific content frameworks. This is the **generic, cross-project** skill. For project-specific rules (MDX components, content schemas, file naming conventions, build tools, linter integration), look for a local `content-config` skill in the repository.

## Keywords
content creation, blog posts, SEO, brand voice, social media, content calendar, marketing content, content strategy, content marketing, brand consistency, content optimization, social media marketing, content planning, blog writing, content frameworks, brand guidelines, social media strategy

## Content Awareness (MANDATORY for all new content)

Before creating ANY new content piece (blog post, project, page), you MUST gather context from existing content to ensure consistency, enable cross-linking, and avoid duplication.

### Step 0: Duplicate & Overlap Gate (MUST run first)

**Before any research, outlining, or writing**, scan ALL existing content to check whether the proposed topic already exists or substantially overlaps with an existing piece. This is a hard gate — do not proceed until cleared.

1. **Scan titles, slugs, and descriptions** of every existing content piece
2. **Flag any overlap** — a post counts as overlapping if it targets the same primary keyword, covers the same core question, or would compete for the same SERP
3. **Decision matrix:**

| Finding | Action |
|---------|--------|
| Exact duplicate (same topic + angle) | **Stop.** Do not create. Suggest updating the existing post instead. |
| Substantial overlap (same topic, different angle) | **Stop.** Propose either (a) updating/expanding the existing post or (b) a clearly differentiated angle that the user must approve before proceeding. |
| Tangential overlap (related topic, distinct focus) | **Proceed** but note the related post for cross-linking and ensure the new piece carves out a distinct keyword and thesis. |
| No overlap | **Proceed.** |

4. **Report the result** to the user before moving on — state which existing posts were checked, whether any overlap was found, and the recommended action.

This step applies equally when **proposing new topics**. Never suggest a topic that duplicates or cannibalizes an existing post. When brainstorming topic lists, cross-reference every candidate against existing content and discard duplicates before presenting options.

### Step 1: Discover Existing Content

Identify how the project manages content (CMS, markdown files, database, etc.) and scan existing content for:
- Existing titles and slugs (avoid duplication)
- Categories in use (use ONLY existing categories unless told otherwise)
- Existing translations (ensure language pairs use matching keys)
- Permalinks (for internal cross-linking)
- Descriptions (avoid overlapping positioning)

### Step 2: Deep-Read Related Content (selective)

After scanning, identify the 2-5 most topically related content pieces and read their full source. This enables:
- **Internal linking**: Reference related posts with correct relative URLs
- **Content differentiation**: Ensure the new piece adds unique value vs. existing content
- **Consistent terminology**: Match how the site talks about specific topics
- **Cross-linking opportunities**: Add links TO the new content FROM existing related content (update those files too)

### Step 3: Cross-Linking Strategy

Every new content piece should:
- Link to 2-3 existing related posts/pages using relative paths
- Be linked FROM at least 1-2 existing related posts (update those files)
- Never use absolute URLs for internal links

## Keyword & Search Research (MANDATORY for all content)

Every content piece must go through a research phase **before writing begins**. This ensures content is optimized for both traditional search engines AND LLM-powered search (ChatGPT, Perplexity, Google AI Overviews).

### Default Intent Priority: Purchase Intent First

Unless explicitly instructed otherwise, **always prioritize purchase-intent keywords and topics** throughout the entire research and writing process. This applies to:

- **Topic selection** — When brainstorming or proposing blog topics, favor topics where the searcher is close to a buying decision (e.g., "best AI consulting for manufacturing" over "what is AI")
- **Keyword research** — Actively search for and prioritize keywords with commercial/transactional intent signals:
  - Comparison terms: "vs", "alternative", "compared to"
  - Evaluation terms: "best", "top", "review", "pricing"
  - Solution-seeking terms: "how to solve", "tool for", "service for", "agency for"
  - Industry-specific buying terms: "Anbieter", "Dienstleister", "Beratung", "Agentur", "Kosten", "Implementierung"
- **Content angle** — Even for educational/informational topics, frame the content to naturally guide readers toward a purchase decision. Include sections that address buyer concerns (pricing, ROI, implementation effort, provider selection criteria)
- **Long-tail keyword selection** — When choosing between equally viable long-tail keywords, always prefer the one closer to a conversion action

**Intent hierarchy (default priority order):**
1. **Transactional** — Searcher wants to buy/hire (e.g., "KI-Beratung für Mittelstand beauftragen")
2. **Commercial investigation** — Searcher is comparing options (e.g., "beste KI-Agentur Deutschland Vergleich")
3. **Informational with buying signal** — Searcher is learning but problem-aware (e.g., "KI-Integration ERP Kosten")
4. **Pure informational** — Searcher is just learning (e.g., "was ist künstliche Intelligenz") — only target if it serves a top-of-funnel strategy explicitly requested by the user

### Step 1: Web Research — Up-to-Date Information & Keywords

Use `WebSearch` to research the topic thoroughly before writing:

1. **Trending angles** — Search for the topic to understand current discourse, recent developments, and competitor coverage
2. **Keyword discovery** — Search for keyword variations and related terms. Identify:
   - 1 primary keyword (highest relevance + search intent match, **prefer purchase intent**)
   - 3-5 secondary keywords (variations, long-tail — **include at least 1-2 with commercial intent**)
   - 10-15 LSI keywords (semantically related terms)
3. **Purchase-intent keyword mining** — In addition to standard keyword discovery, explicitly search for:
   - `"[topic] + Kosten/pricing/cost"` — price-aware searchers
   - `"[topic] + Anbieter/provider/agency/tool"` — solution seekers
   - `"[topic] + Vergleich/comparison/vs/alternative"` — evaluators
   - `"[topic] + Beispiele/case study/ROI"` — proof seekers
4. **Competitor content** — Identify what top-ranking pages cover so the new piece can differentiate

### Step 1b: Keyword Viability Filter — Choose the Right Primary Keyword

After generating keyword candidates, you must **evaluate and select** the primary keyword before writing begins. No access to Ahrefs or Semrush is assumed — use WebSearch as a SERP proxy.

For each candidate primary keyword, run these 4 diagnostic searches:

**1. SERP Authority Check**
```
"[candidate keyword]"
```
Look at the top 3-5 results. Ask:
- Are they Wikipedia, Forbes, HubSpot, or other high-DA sites? -> **Red flag** (hard to displace)
- Are they mid-size agency blogs, niche publications, or 3-5 year old posts? -> **Green flag** (opportunity)
- Are results genuinely thin (short listicles, no depth)? -> **Strong green flag** (outrank with quality)

**2. SERP Intent Check**
```
"[candidate keyword]"
```
Same search — now look at the *type* of content ranking:
- Ranking: blog posts / guides -> we're writing a blog post -> intent match
- Ranking: product pages / SaaS tools -> Google wants transactional content -> adjust angle or keyword
- Ranking: news articles -> recency-driven SERP -> harder to hold long-term

**3. Existing Coverage Check**
```
site:yourdomain.com "[candidate keyword]"
```
- If already ranking -> build on existing post, don't create duplicate
- If nothing -> clean slate, proceed

**4. Long-Tail Demand Check**
```
"[candidate keyword] [qualifier]"
```
If the head term looks too competitive, this reveals whether a long-tail variant has real usage. If community results appear (Reddit, Quora, LinkedIn) -> people are asking it -> demand confirmed.

---

**Keyword Selection Decision Rule:**

| Signal | Head Term | Pivot to Long-Tail |
|--------|-----------|-------------------|
| Top 3 are Wikipedia / Forbes / major SaaS | No | Yes |
| Top 3 are agency blogs, old posts | Yes | — |
| SERP intent matches content type | Yes | Yes |
| SERP intent mismatch (transactional) | No | Yes (add qualifier) |
| We already have content on this | No | No (update existing) |
| Long-tail has clear community demand | — | Yes |
| **Keyword has purchase/commercial intent** | **Prefer** | **Prefer** |
| Keyword is purely informational, no buying signal | Deprioritize | Deprioritize |

**Output of this step:** One confirmed primary keyword with a documented rationale (2-3 sentences: why this keyword, why it's winnable, what the differentiation angle is vs. top-ranking results). **Include the intent classification** (transactional / commercial investigation / informational with buying signal / pure informational) and explain how the content will guide readers toward a conversion.

### Step 1c: Competitor Content Deep Analysis (MANDATORY)

After confirming the primary keyword, **fetch and analyze the actual page content** of the top-ranking results. SERP snippets alone are not enough to differentiate — you must understand what competitors actually cover.

**Process:**

1. **Select targets** — From the SERP Authority Check (Step 1b), pick the **top 3 organic results** that match the content type you're creating (skip irrelevant results like directories, forums, or tool pages)
2. **Fetch each page** — Use `WebFetch` to retrieve the full page content
3. **Extract and document** the following for each competitor page:

| Dimension | What to capture |
|-----------|----------------|
| **Heading structure** | All H1-H3 headings (reveals their content outline) |
| **Word count** | Approximate length (sets the depth bar to beat) |
| **Key topics covered** | Main themes and subtopics addressed |
| **Unique angles** | Any original data, frameworks, case studies, or perspectives |
| **Content gaps** | Topics they mention superficially or skip entirely |
| **CTA strategy** | What they're selling and how they pitch it |
| **Freshness** | Publication/update date if visible |
| **Media & assets** | Tables, calculators, infographics, videos, downloadable resources |

4. **Synthesize a content gap report** — Compare the 3 competitors against each other and identify:
   - **Table stakes**: Topics ALL competitors cover (you must include these or look incomplete)
   - **Differentiators**: Topics only 1 competitor covers well (opportunity to do it better)
   - **White space**: Topics NO competitor covers (your unique value-add)
   - **Depth gaps**: Sections competitors treat superficially that you can go deep on
   - **Format gaps**: Missing tables, visuals, calculators, or interactive elements you can add

**How to use these findings when writing:**
- **Absorb, don't copy** — Internalize the best insights, data points, frameworks, and examples from competitor pages, then remix them into your own structure with added depth, updated data, or a sharper angle
- **Beat their best sections** — If a competitor has a standout section (e.g., a great comparison table, a unique stat, a practical checklist), create a version that's more comprehensive, more current, or more actionable
- **Fill every gap** — Every white-space topic and depth gap identified above becomes a section in your outline. This is your unfair advantage — cover what they missed
- **Upgrade the format** — If competitors use walls of text, add tables, visuals, or step-by-step breakdowns. If they have basic lists, add real examples or data
- **Cite and surpass** — Where competitors reference data or studies, find the original source, verify it, and add newer or more relevant data points

**Output of this step:** A structured competitor analysis table + a bullet list of 3-5 specific ways the new content will be better/different than what currently ranks. This directly feeds the content outline.

## Creating SEO-Optimized Blog Posts

1. **Keyword & Search Research** (see above)

2. **Content Structure**
   - Use blog template from `references/content_frameworks.md`
   - Include keyword in title, first paragraph, and 2-3 H2s
   - Aim for 1,500-2,500 words for comprehensive coverage

3. **SEO Best Practices**
   - Target keyword density of 1-3%
   - Ensure proper heading structure (one H1, no skipped levels)
   - Add 2-3 internal links and 1-2 external links
   - Write meta description under 160 chars
   - Include featured image with descriptive alt text

4. **Quality Check**
   - Run any project-specific linter (check `content-config` skill or CLAUDE.md)
   - Fix ALL errors AND warnings for new content
   - Proofread and fact-check

### Social Media Content Creation

1. **Platform Selection**
   - Identify primary platforms based on audience
   - Review platform-specific guidelines in `references/social_media_optimization.md`

2. **Content Adaptation**
   - Start with blog post or core message
   - Use repurposing matrix from `references/content_frameworks.md`
   - Adapt for each platform following templates

3. **Optimization Checklist**
   - Platform-appropriate length
   - Optimal posting time
   - Correct image dimensions
   - Platform-specific hashtags
   - Engagement elements (polls, questions)

### Content Calendar Planning

1. **Monthly Planning**
   - Copy `assets/content_calendar_template.md`
   - Set monthly goals and KPIs
   - Identify key campaigns/themes

2. **Weekly Distribution**
   - Follow 40/25/25/10 content pillar ratio (Educational/Inspirational/Conversational/Promotional)
   - Balance platforms throughout week
   - Align with optimal posting times

3. **Batch Creation**
   - Create all weekly content in one session
   - Maintain consistent voice across pieces
   - Prepare all visual assets together

## Quick Start

### For Brand Voice Development
1. Run `scripts/brand_voice_analyzer.py` on existing content to establish baseline
2. Review `references/brand_guidelines.md` to select voice attributes
3. Apply chosen voice consistently across all content

### For Blog Content Creation
1. **Read existing content indexes** (see Content Awareness above)
2. **Deep-read 2-5 related posts** for linking and differentiation
3. **Keyword & Search Research** (see dedicated section)
4. Choose template from `references/content_frameworks.md`
5. Write content following template structure, weaving in discovered keywords
6. Run project-specific linter if available (check `content-config` skill)
7. Fix ALL issues for the new post(s)
8. Update related existing posts with links to the new content

### For Social Media Content
1. Review platform best practices in `references/social_media_optimization.md`
2. Use appropriate template from `references/content_frameworks.md`
3. Optimize based on platform-specific guidelines
4. Schedule using `assets/content_calendar_template.md`

## Key Scripts & Tools

### brand_voice_analyzer.py
Analyzes text content for voice characteristics, readability, and consistency.

**Usage**: `python scripts/brand_voice_analyzer.py <file> [json|text]`

**Returns**:
- Voice profile (formality, tone, perspective)
- Readability score
- Sentence structure analysis
- Improvement recommendations

## Reference Guides

### When to Use Each Reference

**references/brand_guidelines.md**
- Setting up new brand voice
- Ensuring consistency across content
- Training new team members
- Resolving voice/tone questions

**references/content_frameworks.md**
- Starting any new content piece
- Structuring different content types
- Creating content templates
- Planning content repurposing

**references/social_media_optimization.md**
- Platform-specific optimization
- Hashtag strategy development
- Understanding algorithm factors
- Setting up analytics tracking

## Best Practices

### Content Creation Process
1. Always start with audience need/pain point
2. Research before writing
3. Create outline using templates
4. Write first draft without editing
5. Validate with project-specific linter if available
6. Edit for brand voice
7. Proofread and fact-check
8. Optimize for platform
9. Schedule strategically

### Quality Indicators
- SEO score above 75/100
- Readability appropriate for audience
- Consistent brand voice throughout
- Clear value proposition
- Actionable takeaways
- Proper visual formatting
- Platform-optimized

### Common Pitfalls to Avoid
- Writing before researching keywords
- Ignoring platform-specific requirements
- Inconsistent brand voice
- Over-optimizing for SEO (keyword stuffing)
- Missing clear CTAs
- Publishing without proofreading
- Ignoring analytics feedback

## Performance Metrics

Track these KPIs for content success:

### Content Metrics
- Organic traffic growth
- Average time on page
- Bounce rate
- Social shares
- Backlinks earned

### Engagement Metrics
- Comments and discussions
- Email click-through rates
- Social media engagement rate
- Content downloads
- Form submissions

### Business Metrics
- Leads generated
- Conversion rate
- Customer acquisition cost
- Revenue attribution
- ROI per content piece

## Integration with Project-Specific Skills

This skill provides the generic framework. Individual repositories should have a **`content-config`** skill (or equivalent) that defines:
- Project-specific content schemas and frontmatter fields
- Available components (MDX, React, etc.)
- File naming conventions
- Build tools and linter commands
- Brand identity and voice specifics
- Category taxonomies
- Bilingual/i18n rules
- Image generation pipelines

Always check for a local `content-config` skill before creating content in any repository.
