---
title: Understanding Git with Ben Chatelain
date: 2020-10-10 00:00
description: "In this episode, Leo talks with Ben Chatelain about Git. They chat about
  branching strategies, merging strategies, Xcode headaches, and... using emojis in
  your commit messages!\U0001F631\U0001F973\U0001F44F"
featuredImage: https://images.transistor.fm/file/transistor/images/episode/365802/full_1601913251-artwork.jpg
youtubeID: C0Ymu7vx_ko
audioDuration: 3386
videoDuration: 3388
---
<p><b>Guest</b></p><ul><li>
<a href="https://twitter.com/phatblat"><strong>Ben Chatelain (@phatblat)</strong></a><ul>
<li>
<a href="https://github.com/phatblat">Github @phatblat</a> - for great commit message examples!</li>
<li><a href="https://www.twitch.tv/phatblat">😎Some Cool DJ Sets 😎</a></li>
</ul>
</li></ul><p><a href="https://youtu.be/C0Ymu7vx_ko"><strong>YouTube Video - https://youtu.be/C0Ymu7vx_ko</strong></a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/4011273d"><strong>Episode 29 - Managing iOS Development with Peter Witham</strong></a></li>
<li><a href="https://share.transistor.fm/s/e38854fe"><strong>Episode 46 - Developer Community (Part 2) with Dave Verwer</strong></a></li>
<li><a href="https://share.transistor.fm/s/2445da70"><strong>Episode 64 - A Very Remote Year with Jacob Gorban</strong></a></li>
</ul><p><b>Related Links</b></p><ul>
<li>
<a href="https://www.pluralsight.com/courses/codemash-session-96">A Brief History of Version Control : Codemash by Brian Meeker</a> </li>
<li><a href="https://en.wikipedia.org/wiki/Microsoft_Visual_SourceSafe">MS Visual SourceSafe 👴</a></li>
<li><a href="https://en.wikipedia.org/wiki/Concurrent_Versions_System">CVS 👴</a></li>
<li><a href="https://www.youtube.com/watch?v=rCrzDaiMP4M&amp;list=PLnD_TKDSaFyVd00l0Py7LnIZxpyF9jeYj&amp;index=14">Level up Your Git Commits with Gitmoji! </a></li>
<li><a href="https://www.git-tower.com/mac">Tower</a></li>
<li><a href="https://git-scm.com/book/en/v2">Pro Git Book</a></li>
<li><a href="https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow">Gitflow</a></li>
<li><a href="https://trunkbaseddevelopment.com/">Trunk Based Development</a></li>
<li>
<a href="https://github.com/mas-cli/mas">mas</a> - A simple command line interface for the Mac App Store</li>
<li><a href="%20https://dangitgit.com/en">Dangit, Git!?!</a></li>
<li>`git log -g` (a better reflog)</li>
<li>Tip: <em>always delete topic branches after merging a PR (or have </em><a href="https://docs.github.com/en/free-pro-team@latest/github/administering-a-repository/managing-the-automatic-deletion-of-branches"><em>GitHub do it for you</em></a><em>)</em>
</li>
<li>Ben’s git shortcuts as <a href="https://github.com/search?q=git+repo%3Aphatblat%2Fdotfiles+extension%3Afish&amp;type=Code&amp;ref=advsearch&amp;l=&amp;l=">fish shell functions</a><ul>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/amendne.fish">amendne</a> - amend the last commit, reusing the existing commit message</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/bundle-pull.fish">bundle-pull</a> - transports a dirty working copy from one machine to another. </li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/git_bundle_create.fish#L37">git_bundle_create</a> - creates a <a href="https://git-scm.com/docs/git-bundle">git bundle</a> by stashing a dirty working copy</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/ignore.fish">ignore</a> - adds file paths to .gitignore file</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/lg.fish">lg</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/lga.fish">lga</a> - minimal yet pimped out history graph</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/new.fish">new</a> - show new commits received after a pull</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/pop.fish">pop</a> - remove the last commit, but keep the changes in the working copy</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/publish.fish">publish</a> - push a new branch to a remote</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/review.fish">review</a> - inspect the last commit</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/rewrite.fish">rewrite</a> - uses filter-repo to correct an author email typo (destructive)</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/scrub.fish">scrub</a> - uses filter-branch to delete files from history (destructive)</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/root.fish">root</a> - prints the path to the root of the local repo</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stash.fish">stash</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stsave.fish">stsave</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stlist.fish">stlist</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stshow.fish">stshow</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stpop.fish">stpop</a>, <a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/stdrop.fish">stdrop</a> - functions for working with stashes</li>
<li>
<a href="https://github.com/phatblat/dotfiles/blob/master/.config/fish/functions/suri.fish">suri</a> - submodule update recursive init</li>
</ul>
</li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>If you want your app to succeed, there's never been a better time to read up on App Store Optimization and Appfigures provides that for you. </p><ul>
<li>Check out their <a href="https://appfigures.com/resources">great articles and guides on app store optimization </a>
</li>
<li>
<a href="https://appfigures.com/resources/tagged/aso-teardown">Brand new teardowns of specific apps</a>, like <a href="https://appfigures.com/resources/aso/optimization-teardown-spotify">Spotify</a> for instance or indie apps like <a href="https://appfigures.com/resources/aso/aso-teardown-fotmob">Fotmob</a>.</li>
<li>
<a href="https://appfigures.com/reports/competitors?utm_source=empowerapps">New competitor's report in the Appfigures dashboard</a> where you are able to view competitor downloads, build performance benchmarks, and see the new trends as they happen. <a href="https://appfigures.com/reports/competitors?utm_source=empowerapps">Check it out here.</a>
</li>
<li>Check out more of their resources at <a href="http://appfigures.com/resources">appfigures.com/resources</a>.</li>
</ul><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><br><a href="https://transistor.fm/?via=empowerapps"><strong>Transistor.Fm</strong></a><br><em>Your podcast's publishing platform<br></em>Transistor not only hosts your podcast but also:</p><ul>
<li>
<strong>Help distribute your podcast with integrations</strong> to Apple Podcasts, Spotify, Google Podcasts, YouTube, and Mailchimp</li>
<li>
<strong>Deep analytics</strong> including average downloads per episode, popular podcast apps, number of subscribers, trends</li>
<li>
<strong>Professional support</strong> for creatives, businesses, and professional podcasters when it comes to hosting and analytics</li>
</ul><p><a href="https://transistor.fm/how-to-start-a-podcast/?via=empowerapps"><strong>How do you start a podcast?</strong></a><br><a href="https://transistor.fm/how-to-start-a-podcast/?via=empowerapps">https://transistor.fm/how-to-start-a-podcast/?via=empowerapps</a></p><p>Try it today with<a href="https://transistor.fm/?via=empowerapps"> this special link:</a><br><a href="https://transistor.fm/?via=empowerapps">https://transistor.fm/?via=empowerapps</a></p><p><b>Git Tips and Tricks</b></p><ul>
<li>Know the Git Terminal Command</li>
<li>What Xcode can help with</li>
<li>How Tower Helps</li>
<li>Gitflow vs Trunk Based</li>
<li>What are the different ways to branch</li>
<li>merge vs squash vs rebase</li>
<li>Dealing with Git Submodules 😱</li>
<li>Merging Xcode Projects and Storyboards 🤬</li>
<li>Creating great commit messages</li>
</ul><p><b>Git Terminology</b></p><ul>
<li>How is a Pull Request useful</li>
<li>How Branches work in Git</li>
<li>How to use Tags in Git</li>
<li>What is a Pull Request draft?</li>
<li>What is a Git Stash?</li>
<li>What is Gitmoji?</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><br></p><p><strong><a rel="payment" title="★ Support this podcast on Patreon ★" href="https://www.patreon.com/empowerappsshow">★ Support this podcast on Patreon ★</a></strong></p>
      