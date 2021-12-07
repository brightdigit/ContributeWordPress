---
title: Awaiting for Async with Vincent Pradeilles
date: 2021-02-26 00:00
description: In this episode, Leo talks with Vincent Pradeilles about the new async
  and await features coming to Swift. Leo and Vincent get into the challenges adopting
  it and the design around as well as how it helps to help with building multi-threaded
  asynchronous applications.
featuredImage: https://images.transistor.fm/file/transistor/images/episode/469038/full_1613855866-artwork.jpg
youtubeID: hcVJSu7we5w
audioDuration: 2656
videoDuration: 2658
---
<p><b>Guest</b></p><ul><li>
<strong>Vincent Pradeilles </strong><ul>
<li><a href="https://twitter.com/v_pradeilles">Twitter @v_pradeilles</a></li>
<li><a href="https://www.youtube.com/c/vincentpradeilles">YouTube Channel (vincentpradeilles)</a></li>
<li><a href="https://github.com/vincent-pradeilles/">GitHub</a></li>
<li><a href="https://www.linkedin.com/in/vincentpradeilles/">LinkedIn</a></li>
<li><a href="https://twitter.com/ios_memes">Also iOS Memes 😆 ... </a></li>
</ul>
</li></ul><p><a href="https://youtu.be/hcVJSu7we5w"><strong>Youtube Video - https://youtu.be/hcVJSu7we5w</strong></a></p><p><b>Related Episodes</b></p><ul>
<li><a href="https://share.transistor.fm/s/a8b66b9f"><strong>Episode 75</strong> - <strong>Year of the Server with Tim Condon - Part 2</strong></a></li>
<li><a href="https://share.transistor.fm/s/b203049d"><strong>Episode 72 -</strong> <strong>Functional Programming with Daniel Steinberg</strong></a></li>
<li><a href="https://share.transistor.fm/s/8442feb7"><strong>Episode 47 -</strong> <strong>Practical Combine with Donny Wals</strong></a></li>
</ul><p><b>Related Links</b></p><ul>
<li><a href="https://github.com/apple/swift-evolution/blob/main/proposals/0296-async-await.md">Swift Evolution Proposal</a></li>
<li>
<a href="https://learningswift.brightdigit.com/asynchronous-multi-threaded-parallel-world-of-swift/">Asynchronous Multi-Threaded Parallel World of Swift</a> by Leo </li>
<li><a href="https://www.youtube.com/watch?v=C0tx4Cionus">Experimenting with async &amp; await in Swift by Vincent</a></li>
<li><a href="https://www.youtube.com/watch?v=IwAO06Xt4OY">Running tasks in parallel using async/await 🚀 by Vincent</a></li>
<li><a href="https://github.com/mxcl/PromiseKit">PromiseKit by Max Howell</a></li>
<li><a href="https://docs.vapor.codes/4.0/async/">EventLoopFuture in Vapor (and SwiftNIO)</a></li>
<li><a href="https://github.com/leogdion/AsyncAwaitSwift">Leo's Async Await Test Code</a></li>
<li><a href="https://gist.github.com/lattner/429b9070918248274f25b714dcfc7619">Chris Lattner's Async Proposal</a></li>
<li><a href="https://www.enekoalonso.com/articles/getting-started-with-async-await-in-swift">Getting started with async/await in Swift by Eneko Alonso</a></li>
</ul><p><b>Sponsors</b></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030"><strong>AppFigures</strong></a><strong><br></strong><em>The tools you need to monitor, optimize, and get more downloads.</em><strong></strong></p><p>There's a lot of demand for apps right now, so it's a really great time to give it a try. It's easier than you think.<br>The guys who run it are indie devs who had a need and created a tool. 11 years later, it's an all-in-one platform for developers who want to get more downloads and make more money with their apps.</p><p>The folks at Appfigures have <a href="https://appfigures.com/resources/aso">easy step-by-step guides and intuitive tools to do that</a>, which many indie developers are using to get more downloads:<br><a href="https://appfigures.com/resources/aso">https://appfigures.com/resources/aso</a></p><p>Also check out <a href="https://share.transistor.fm/s/15b7ff63">our episode with CEO Ariel Michaeli:<br>https://share.transistor.fm/s/15b7ff63</a></p><p><a href="https://appfigures.com/account/upgrade?p=empower3030">Try Appfigures for free, and if you like it use the special link to get 30% off for the next 3 months:</a><a href="https://www.linode.com/?r=97e09acbd5d304d87dadef749491d245e71c74e7"><br></a><a href="https://appfigures.com/account/upgrade?p=empower3030">https://appfigures.com/account/upgrade?p=empower3030</a></p><p><a href="https://swiftheroes.com/2021/"><strong>Swift Heroes Digital 2021</strong></a><strong></strong></p><p>Swift Heroes Digital is a one day event, for developers, designers and project managers at all levels of experience with the Swift platform. Combining resources from the Swift Heroes Global network, we’re excited to be bringing you this international, interactive event. </p><p>Share this code with your network and they receive 20% discount on all Swift Heroes tickets: SH21-SPEAKERS-COMMUNITY<br>Insert the code under 'redeem voucher' on the <a href="https://pretix.eu/advento/SH2021/">ticketing platform</a> to receive 20% discount on all ticket types.</p><p><b>Dealing with Asynchronous Calls Now</b></p><ul>
<li>Dealing with GCD</li>
<li>History of CPU Cores and Asynchronous Programming</li>
<li>Power of GCD and Queues</li>
<li>How Promises fit in with Swift</li>
<li>Managing Network Call Asynchronously</li>
<li>Dealing with UI Changes</li>
<li>What is a DispatchGroup</li>
</ul><p><b>What Await and Async Provide</b></p><ul>
<li>Avoiding Blocking the Main Thread</li>
<li>Subscribing/Publisher vs Async/Await</li>
<li>How do <em>Tasks</em> work</li>
<li>How to get started <strong>now</strong> with Async and Await</li>
<li>What are <em>Continuations</em>
</li>
<li>What is an <em>Unsafe Continuation</em>
</li>
<li>Dealing with Errors in Async Functions</li>
<li>How do parallel asynchronous tasks</li>
<li>How Combine works with Async/Await</li>
</ul><p><b>Social Media</b></p><p><strong>Email</strong><br>leo@brightdigit.com<br><a href="https://github.com/brightdigit">GitHub - @brightdigit</a></p><p><a href="https://twitter.com/brightdigit"><strong>Twitter </strong><br>BrightDigit - @brightdigit</a><br><a href="https://twitter.com/leogdion">Leo - @leogdion</a></p><p><a href="https://www.linkedin.com/company/bright-digit"><strong>LinkedIn</strong><br>BrightDigit</a><br><a href="https://www.linkedin.com/in/leogdion/">Leo</a></p><p><a href="https://www.instagram.com/brightdigit/">Instagram - @brightdigit</a><br><a href="https://www.patreon.com/empowerappsshow">Patreon - empowerappshow</a></p><p><b>Credits</b></p><p><a href="https://filmmusic.io/">Music from https://filmmusic.io</a><br><a href="https://incompetech.com/">"Blippy Trance" by Kevin MacLeod (https://incompetech.com)</a><br><a href="http://creativecommons.org/licenses/by/4.0/">License: CC BY (http://creativecommons.org/licenses/by/4.0/)</a></p><p><strong><a rel="payment" title="★ Support this podcast on Patreon ★" href="https://www.patreon.com/empowerappsshow">★ Support this podcast on Patreon ★</a></strong></p>
      