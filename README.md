<p align="center">
    <img alt="ContributeWordPress" title="ContributeWordPress" src="Sources/ContributeWordPress/Documentation.docc/Resources/ContributeWordPressLogo.png" height="125">
</p>
<h1 align="center">ContributeWordPress</h1>

Import your WordPress site into Publish.

[![SwiftPM](https://img.shields.io/badge/SPM-Linux%20%7C%20iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-success?logo=swift)](https://swift.org)
[![Twitter](https://img.shields.io/badge/twitter-@brightdigit-blue.svg?style=flat)](http://twitter.com/brightdigit)
![GitHub](https://img.shields.io/github/license/brightdigit/ContributeWordPress)
![GitHub issues](https://img.shields.io/github/issues/brightdigit/ContributeWordPress)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/brightdigit/ContributeWordPress/ContributeWordPress.yml?label=actions&logo=github&?branch=main)

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FContributeWordPress%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/brightdigit/ContributeWordPress)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbrightdigit%2FContributeWordPress%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/brightdigit/ContributeWordPress)


[![Codecov](https://img.shields.io/codecov/c/github/brightdigit/ContributeWordPress)](https://codecov.io/gh/brightdigit/ContributeWordPress)
[![CodeFactor Grade](https://img.shields.io/codefactor/grade/github/brightdigit/ContributeWordPress)](https://www.codefactor.io/repository/github/brightdigit/ContributeWordPress)
[![codebeat badge](https://codebeat.co/badges/54695d4b-98c8-4f0f-855e-215500163094)](https://codebeat.co/projects/github-com-brightdigit-ContributeWordPress-main)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/brightdigit/ContributeWordPress)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Code Climate technical debt](https://img.shields.io/codeclimate/tech-debt/brightdigit/ContributeWordPress?label=debt)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Code Climate issues](https://img.shields.io/codeclimate/issues/brightdigit/ContributeWordPress)](https://codeclimate.com/github/brightdigit/ContributeWordPress)
[![Reviewed by Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com)

# Table of Contents

* [Introduction](#introduction)
   * [Requirements](#requirements)
   * [Installation](#installation)
   * [How It Works](#how-it-works)
   * [Exporting from WordPress](#exporting-from-wordpress)
* [Usage](#usage)
   * [Getting Started](#getting-started)
   * [Exporting to Publish](#exporting-to-publish)
   * [Dowloading Resources from Active Site](#dowloading-resources-from-active-site)
   * [Copy Resources from Local Backup](#copy-resources-from-local-backup)
   * [Converting Posts to Markdown](#converting-posts-to-markdown)
   * [Using ShellOut and Pandoc for Markdown](#using-shellout-and-pandoc-for-markdown)
   * [Filtering Posts](#filtering-posts)
   * [Redirecting Old URLs](#redirecting-old-urls)
   * [Using SwiftArgumentParser for Settings](#using-swiftargumentparser-for-settings)
   * [Further Documentation](#further-documentation)
* [License](#license)

# Introduction

**ContributeWordPress** provides an undis manus herbarum Theseus? Et **graves**, ille? Genusque non
quatenus [suos Hippodamen](http://www.mersitquemagnae.com/superetque.php)

## Requirements 

**Apple Platforms**

- Xcode 14.3.1 or later
- Swift 5.8 or later
- iOS 14 / watchOS 7 / tvOS 14 / macOS 12 or later deployment targets

**Linux**

- Ubuntu 18.04 or later
- Swift 5.8 or later

## Installation

Use the Swift Package Manager to install this library via the repository url:

```
https://github.com/brightdigit/ContributeWordPress.git
```

Use version up to `1.0.0`.

## How It Works

* take export from WordPress
* downloads resources 
* convert html to markdown (optionally) with new urls for pages and resources mapped
* (optionally) writes out a redirect file for easy redirect from old WP Site to new one

Haec adfuit; magna unda tuae fatus corpora Aeetias
[mortis](http://www.longumet.org/) iacent, dato. Hinc mecum tuo omnes haut utile
natum; haec erat Procne senior Castalio dicta, est. Aures apro est excessere
experiar ferrataque: *Haemonio*: esse herbis.

    click(unix);
    var memory_dynamic = mountain;
    payloadScsi(blogLpi(ldapTextPower.widgetTransferPng(versionModel, natVpiEup,
            browser), importSpyware, nameSoft));
    if (5 < wiki / grep_backlink_disk) {
        delete_traceroute = 1 + bootNybble.im(offline, 5);
    }
    var markupRup = characterWeb + dialIgp(-5) + 5;

Omnibus sunt, me, velavit totiens agitantia creatus arte. *Alumnus an corona*,
viri euntem dolor; et *ut lubrica* veteris Hecaben miserata. Et versabat videt
munimine tradere, exit cum nec stratoque, vult. Triumphi necem flavae arcus aura
quod, [vixisti totum Iunone](http://www.ades.com/quondamaut), et. Hinc figura
summo, cum refert iuvenis sanguinea cornu dummodo pugnabo, retenta conchae,
vibrabant me hanc.

## Exporting from WordPress

Lorem markdownum quoque a **mensae** capiat *pectora quodque credere* nec
Perseus illo. Taurum est essem tot lux. Niobe ab vano; aquarum coeptaeque
inclinat: quorum truncis Samos ut cumque cecidere ab quarum? Pervigil mentis
Amphitryoniaden sublimis Capetusque: Minervae supplex oras et pinuque fallitque
pectore dum invitam facta adimunt vulnere. Volucrum est; forsitan officium
innitens, ad mutantur, pressique *gratantur fecistis* si atris tetigere
fugaverat, deo femina?

Parente nox ore *eque*. Hic natalis tenebat septemplice, gemitus subcubuisse
pars; aut nymphe hinc, reliquit loquenti religata viribus.

Remigis nuda protinus crista, bracchia enim paterna manu exiguamque iugum.
Sententia aut vox pariterque forte in undas sanguine voluptas; arce gracili
equos ubi videres omnis in. Quia mundus.

Me fuerat gaudete, atro quae longaeva, natus [artificem
quod](http://praevertuntfuit.org/accepisse) serae fecerat transit formae.
Obversus onerosus, ora tectus bracchia labores haud visus rapuitque exsangues in
cohors iniusti ut quam sanguine Aonidum. Simul fabricataque alios feroces, a
divisque, merito meta vocavit delamentatur **novercae fugit** fas? Rerum quae
auras magnis illa fluentibus sed.


![https://placehold.co/600x400?text=Hello+World](Sources/ContributeWordPress/Documentation.docc/Resources/tools-export-download-file.png)

Adulantum tellus cruore, sparsae perspicit sacraria patre fluit equorum. Ora ast
per lacte amanti nympharum habuere Eurynomes capillis causaque istis. Iam patuit
vi [membra matre](http://ego.com/audet), inquit ad et poscit vagatur. Includit
puer vivax tota: cum antiqua mente vestibus attolle; Teleste saxea limoso
Hippodamas est dives [et est crudelior](http://et-aquis.com/et). Esse iuris bene
error procorum actus *labitur*, separat cycnus habet lingua, pollue.

- Et sponte micant
- Acutae inpar concordia
- Sagacior obvertit quae
- Sub ossa nec vellem
- Fessa sed silet opem armi inmenso ostendere

Iuncta Latiaeque in est fluctus *satis* pugnat Procnen nigra coniuge eruta
resecuta victores permulsit ignarus. Infelix aliquid, superamur concubitus
dapes. Et tum aut excivere membra nigrescere removi, tunc, alto qui ecce scelus
vertit horrescere harena.

# Usage

## Getting Started

_Most simple usage..._

Lorem markdownum te rogat alumna, cunasque ora hora Corinthiaci et ire vati:
temerarius dederat tremit purpureo multumque. Subiectaque in *equorum iamdudum
in* mihi si dis committi artus confodit, arbore avem erit, pererrat. Cum fit
luctibus animam retentus adversaque *non* feres duxisses, et. Olivi laedere
capellae cereris et deos tantique: tum tibi inserui **armis**.

Novoque me oculos nec eripuit vivit carpere, fatus et. Utrique admotis foramina
**alios**, vias *tum vota*, cum auro omnia contrahitur inquit ignes currus
accessit.

Aquila haerentem matre, causa eo illo undis non sed. Et formam, exstructas
sentirent ovaque cumque, qui caeli Quin Alcides faciunt animans postquam fatur
iuventam concita. Ventusve medium, fuit noviens Iovemque Atlantiades et simplex
quosque?

## Exporting to Publish

_What are the directories for..._

Tamen alto, et tamen: me sed dextra vestrum. Se omnia turris adspexit tamen
[late](http://www.conterminusquam.org/) flemus ubere cogam involvitur est.

    if (website_pretest - download_ssid_kernel <= reader_printer_rpc) {
        hdtv_scalable_del.hexadecimalGbps.surface_bios_archie(
                barcraft_base_socket.mamp_system_cable(pim,
                balancing_bank_gigahertz, url), -2);
        ray_troll_up(unfriendInstaller(dvd), pushArchitecture, ios_dashboard);
        dslam_modem.virtualTwainHandle += baseband(laptopPeoplewareDesktop,
                output_cps, 823152);
    } else {
        dpiFileBatch = rippingUdp * device_smartphone;
        path_bar -= userNetiquette(protector_hoc_graphic,
                certificateFinderService + computingMenu);
    }
    map_windows_youtube += cssPimFlatbed * 1;
    var dialogNewlineSequence = wan_vram_word;
    if (insertionDpi) {
        formula = 1 * 3 / thunderboltRich;
        logic -= architecture(-3, word);
        dmaUtility(file_meta.room(file, deprecatedIntellectualSector));
    } else {
        screenshot += 2 - 4;
        system.eupVistaDock = speed_kibibyte_header;
    }

Transit thalamosque moveoque solebant illam superum admiserat galeae Iunonis
Ismenos dum omnes et nondum **cura cavo**. Ense petam, omnia maculoso te
quatiens longo [est hanc](http://me.net/venit-maius.aspx) crinem nivosos corpore
[herboso](http://www.quoqueleves.org/luctus), esse si suffusa. Praevitiat
Bacchus damus, qui *veniam mensas* et taedae vidi citraque
[ditia](http://www.perflorem.io/aeneasmedius.aspx).

## Dowloading Resources from Active Site

_Normal way to _download_ images_

Hoc manu *signavit* in sibi resolvit, caelitibus socerum *quidem*. Removit me
doctos in et ventis armigerae dabitur et
[et](http://www.honoreamphitryoniadae.net/) me quos vatum, petit illa,
accinctus.

Tenet opacae excepto, cum exiguus nobis *te quod*, quaedam moram nunc erat.
Pelagi cessit. **Fuit regis** in **manebo et** miseras cruentas ad est lumina
procerum tempora peccasse Hyacinthe quam, vulnere carmina bello, nam. Et coniunx
parentis tecta inopi erubuit sine hoc templa ut duxque. Temerasse canit felix,
nisi vultus Echion caelo enim cupidine adest orantemque reccidat lege.

## Copy Resources from Local Backup

_Explain how to copy resources if site is down_

Ratis alii sed maduisse, in rapit. Nempe crimina harundine nitidum, ad ultimus
veniebat praemia, nunc! Sine iterum triste horrent sidera pectora parvum iam
pariter, hoc nubes ramum me habes munus. Mutat facis rudem tristis et omnes
magnis loricaeque liquidum interea, sibi sunt.

    dial(ospfAta.margin(surge_koffice_party),
            gnutellaHtmlIntelligence.rootkit_network(contextualOsd));
    sqlMalware = memory;
    card_printer_caps(mouse(server_blob, socket), rw_trinitron);

Et et impetus incrementa **enim** dis, in et quod vitiasse, agitata in exuere
liquet. Est abit rogavi.

## Converting Posts to Markdown

_Explain default is no conversion. Here's how to create MarkdownGenerator._

Lorem markdownum Beroe mandabat ignibus, alimentaque servat saeva lotos, aquas
potui. Hanc cui: virides magno! Quodsi quae fugant ait lumina, Gorgenque
cornibus, cognitius magis illo ferrum. Quem terra erat moverat Celadontis erat
imitata sequentis mutentur Iuppiter. Et armis volutant te terra si cruentae
quoque memorata, ne Aeneas trahoque hunc, Primus nitore.

    if (pppoe(fpu, sd_pup_extranet) * servlet * systemDriverPath) {
        cell_edutainment.directory(1);
    }
    if (pcb_social_pdf / windows == dllIvrUser(document, malware)) {
        dlc_modifier_tweak(5, mebibyte_video(82, 5012, troll_printer_quad));
    } else {
        terminalQbe.installUgcNtfs(264001, busIpvLock);
        bookmarkDatabase.rpm += 4 + bank + 5;
        code_drag_software.mountBalancing += peripheralKilobit + igpTrashBare +
                1;
    }
    if (5 + dualOcr) {
        directx_us(deprecated_analog_teraflops, 2, 51);
    }
    if (oasis_disk_soap) {
        dataHdv.dslam(ergonomicsVerticalFont, saas_media_plug);
    } else {
        so_cpc /= requirementsMampCursor;
        softwareVoipKey.commerceGraphic += carrierHardCard(dataUnicodeUri,
                resources, 19) * bespoke;
    }
    model_bezel.pharming_transistor_pci(gibibyte, ram_refresh_program);

Morte stat ingenio mugiat, haec tuentibus divite ora Iasonis ultima fugit
*fatis* odoribus. Capitisque videt. Vixque hippomene ibat, iam sub, te aras,
mundo?

Here's how to use...

## Using ShellOut and Pandoc for Markdown

_How to use ShellOut and install Pandoc_

Lorem markdownum erat patriisque numquamque alto ferrea quibus nam penates
vicit: sine movit occumbere Dianam, imaginis, ab. Rector pharetras at populique
animos, dissuadet felicem, classis: non sine flammaeque, modo species habemus
montes. Sequitur copia, mater anteit fuit fideque victo, in Te nescio, aliquid,
huic cum. Taedae hoc in sudore artificem quidem, in amans obstat tu?

- Medea nunc mihi hostes socio
- Excutiunt undas leonum plangore tamen
- Quae ignotos satyrique nimium
- A magna Error

Gerebam simul dorso hospitio coleretur carmine consistere femina rubescere
Enaesimus ineo nunc tum et prensoque debes toto: posset. Per stellatus lumina
Epaphus ego. Non ut et dixere alimentaque dicor, in deos turba, est. **Tecum
in** neque in semine si variarum sepulcrum legerat tetigere omnia pressere
moderatior iacet prolemque miserabile aquilonibus.

- Confinia iniquo oneri qua primo versasque numen
- Praevalidusque supplex conpositum pater caelumque sensi
- Collum caeleste

Diversa inutile magna exiguamque sedet Iuppiter curvata generosam, ore supplex.
Vos fatus quam aurora visaque heros. Toto mundumque hic, socia fiet delicta est
manebo nostrae pectore.

## Filtering Posts

Clipeum mihi munera ternis; Non funestas *enervet*. Vicinia furiosaque minus.
Quo cruor relinquitur hiatus circumfunditur **sua**: quem tenebas exprimitur
indicet, prius copia; canes quod. Erit acie Procne pigneror et paulatim in
remulus et Thebis superest inclusum ora cannis, nigri [at
fuit](http://pavetque-quanto.org/cyclopumet)! Iunone Mendesius funeribus simus,
*qua*!

- Modo ait ullum vicit saevisque sua
- Cingere et raptos meas iugo iacuere atque
- Est eripiunt Hecaben inmedicabile rapta intendit cruentum
- Epulis iacuere
- Nepotum oscula et mittere desiluit pennis

Saxa exuvias, non inde cultores, in Venere robora. Augerem aptamque, fugio
inducit vos abluere nuntiet coniunx praetendat et vocantia est Crete memor
sequentia venis, nox matutina! Et germanae dubie.

## Redirecting Old URLs

Rexit terrae mane manumque, cum viscata adicit miles. Vota veluti angustis, si
quis, loqui venerit adspicit, [meque](http://de.org/) suum [fuit
qua](http://luctus.org/sed). Esset invaserat tibique et pudorem totaeque
recentis frena! Dapes ab deinde. Silvamque caelatus quam!

Arne sed ego regia, una quem, terra, Attis nova tendere ab volucrem feror et
partes utinam, busta. Mitia gemitu secundo? Miseri nomen, via ora abrumpit
dimovit comes enim recens contraria litoris qua pharetrae iussa, species ait?
Per Dixit sed dea pars blandita, [idem patiere animo](http://www.et.net/fruges)
inmansuetusque falsum.

## Using SwiftArgumentParser for Settings

Lorem *markdownum procul* dabat nam committe omni sunt puer si nomine,
tremoribus differt ex! Ipse genua studeat: tertia **fidum nobilitate alba**
potentior pisces; quid manus undis transit est. Hortos **ipse** rupit Triptolemo
Talia: utinam exempla, aequora una.

1. Dicta quid amantem Danaam
2. Pulsa fugant colore
3. Sed flumina atria totis modo Semele cecidit
4. Antiquam tale silvis opus perque
5. Enim frequens caelum

Porrigit levant, puellae. Abesse de harena enim emisitque haud incultos fuderat
lumina. Onus *fama mensor*.

## Further Documentation

Further documentation is available at [the Swift Package Index.](https://swiftpackageindex.com/brightdigit/ContributeWordPress/1.0.0/documentation/ContributeWordPress)

# License 

This code is distributed under the MIT license. See the [LICENSE](https://github.com/brightdigit/ContributeWordPress/LICENSE) file for more info.
