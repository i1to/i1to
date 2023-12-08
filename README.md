
<h1 align="center">Hi there ...</h1> 

<h4 align="center">
  I'm a Junior C Embedded Engineer
</h4>

<h4 align="center">
Here are some ideas to get you started:
</h4>

<h4 align="center">
- 🔭 I’m currently working on DZS
</h4>

<h4 align="center">
- 🌱 I’m currently learning linux c/c++
</h4>

<h4 align="center">
- 💞️ I’m looking to collaborate on ...
</h4>

<h4 align="center">
- 📫 How to reach me yt147612165686@gmail.com
</h4>

<h4 align="center">
- 😄 Pronouns: ...
</h4>

<h4 align="center">
- ⚡ Fun fact: ...
</h4>


<h4 align="center">
  you can ask me something ..💬<a href="https://github.com/Vollereito/Vollereito/issues/new" target="_blank" title="issue">here</a>
</h4>

<h5 align="center">
  <img src="https://i.postimg.cc/1tf08KD5/zhihu.png" height="12" width="12" />
   <a href="https://www.zhihu.com/people/volleritoo" target="_blank" title="zhihu">&nbsp;知乎&nbsp;&nbsp;&nbsp;</a>
</h5>

<h5 align="center">
 <img src="https://i.postimg.cc/QMNJ3Dt7/bilibili.png" height="12" width="12"/>
 <a href="https://space.bilibili.com/306494243" target="_blank" title="bilibili">&nbsp;Bilibili</a>
</h5>


[![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=Vollereito)](https://github.com/anuraghazra/github-readme-stats)

# Visit https://github.com/lowlighter/metrics#-documentation for full reference
name: Metrics
on:
  # Schedule updates (each hour)
  schedule: [{cron: "0 * * * *"}]
  # Lines below let you run workflow manually and on each commit
  workflow_dispatch:
  push: {branches: ["master", "main"]}
jobs:
  github-metrics:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: lowlighter/metrics@latest
        with:
          # Your GitHub token
          # The following scopes are required:
          #  - public_access (default scope)
          # The following additional scopes may be required:
          #  - read:org      (for organization related metrics)
          #  - read:user     (for user related data)
          #  - read:packages (for some packages related data)
          #  - repo          (optional, if you want to include private repositories)
          token: ${{ secrets.METRICS_TOKEN }}

          # Options
          user: Vollereito
          template: classic
          base: header, activity, community, repositories, metadata
          config_timezone: Asia/Shanghai
          plugin_isocalendar: yes
          plugin_isocalendar_duration: half-year
          plugin_languages: yes
          plugin_languages_analysis_timeout: 15
          plugin_languages_analysis_timeout_repositories: 7.5
          plugin_languages_categories: markup, programming
          plugin_languages_colors: github
          plugin_languages_limit: 8
          plugin_languages_recent_categories: markup, programming
          plugin_languages_recent_days: 14
          plugin_languages_recent_load: 300
          plugin_languages_sections: most-used
          plugin_languages_threshold: 0%
