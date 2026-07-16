# Findings for palladius.github.io (2026-07-16)

## 1. Cosa fa il sito e Push Strategy
- **Cosa fa**: È un blog Jekyll (tema `minima`) pensato per essere il blog personale (SREccardo Blog v2).
- **Dove pusha**: Pusha su GitHub nel branch `main` (`git@github.com:palladius/palladius.github.io.git`). Essendo un repository `username.github.io`, GitHub Pages lo builda e serve automaticamente in `https://palladius.github.io/`.
- **Si vede?**: Inoltre, il `README.md` menziona un deployment su Netlify (`sreccardo-blog.netlify.app`), che sembra configurato per buildare dal repository.

## 2. Problemi e Misconfiguration (Contenuto e Strategia)
- **Folder Mismatch (Contenuto/Struttura)**: Il `README.md` dice che tutti i file di Jekyll si trovano sotto una cartella `blog/`, ma in realtà tutti i file (incluso `_config.yml`, `_posts`, ecc.) sono stati spostati nella root directory del repository. Non c'è traccia della cartella `blog/`.
- **Makefile rotto**: Molti comandi nel `Makefile` assumevano che esistesse la cartella `blog/` (es: `cat blog/VERSION` o `cd blog && bundle exec jekyll serve`). Questo faceva fallire la build o i test locali in modo inaspettato.
- **Push Strategy & CI/CD**: Non ci sono GitHub Actions (`.github/workflows`) esplicite, il che significa che si affida alla build legacy/automatica di GitHub Pages (o a Netlify). Se la config di GitHub Pages / Netlify cerca la cartella `blog/`, fallisce miseramente, spiegando perché tu abbia l'impressione che sia "misconfigurato".

## 3. Azioni e Fix Applicati
- Ho rimosso i riferimenti obsoleti alla cartella `blog/` nel `Makefile` e nel `README.md`.
- Ho creato questo file riassuntivo con i finding.
- Procedo ora con una micro-commit locale e attendo la tua istruzione se devo fare un push a origin.
