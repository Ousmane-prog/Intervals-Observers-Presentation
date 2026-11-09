### A Pluto.jl notebook ###
# v1.1.0

using Markdown
using InteractiveUtils

# ╔═╡ 01a49139-b2d9-48a2-b737-7685e6e3ea2a
begin
	using PlutoUI
	using HypertextLiteral
	using Base64
end

# ╔═╡ 94a20083-978e-492b-b056-77ed64687cb5
# Thème global : tout le CSS de la présentation est défini ici, une seule fois.
@htl("""
<style>
  /* ---------- Cadre commun à toutes les slides ---------- */
  .slide {
    position: relative;
    width: 100%;
    aspect-ratio: 16 / 9;
    max-width: 900px;
    margin: 0 auto;
    background: #F0F4F8;
    border-radius: 12px;
    overflow: hidden;
    font-family: Calibri, 'Segoe UI', sans-serif;
    box-shadow: 0 8px 32px rgba(0,0,0,0.3);

    /* Les tailles de texte sont relatives à la LARGEUR DE LA SLIDE (cqw),
       pas à la fenêtre : le rendu est identique dans le notebook et en plein écran.
       --k = échelle globale du texte : augmente-la pour tout agrandir. */
    container-type: inline-size;
    --k: 2.5cqw;
  }
  .slide .bar-top   { position: absolute; top: 0;    left: 0; width: 100%; height: 1.5%; background: #0F3460; }
  .slide .bar-bottom { position: absolute; bottom: 0; left: 0; width: 100%; height: 1.5%; background: #0F3460; }
  .slide .bar-left   { position: absolute; top: 1.5%; left: 0; width: 0.9%; height: 97%;  background: #E94560; }

  .slide .slide-title {
    position: absolute;
    top: 1.5%; left: 2%;
    width: 96%; height: 12%;
    display: flex;
    align-items: center;
    font-size: calc(1.9 * var(--k));
    font-weight: 700;
    color: #1A1A2E;
    background: #FFFFFF;
  }
  .slide .slide-body {
    position: absolute;
    top: 15%; left: 2%;
    width: 96%; height: 75%;
  }
  .slide .slide-footer {
    position: absolute;
    bottom: 4%; left: 2%;
    width: 96%;
    font-size: calc(1.0 * var(--k));
    color: #7F8C8D;
    font-style: italic;
    text-align: center;
  }
  .slide .slide-number {
    position: absolute;
    bottom: 3%; right: 2%;
    font-size: calc(1.1 * var(--k));
    color: #556677;
  }

  /* ---------- Slide de titre (fond sombre) ---------- */
  .slide.title-slide { background: #1A1A2E; box-shadow: 0 8px 32px rgba(0,0,0,0.5); }
  .title-slide .circle-top-right {
    position: absolute; top: -8%; right: -4%;
    width: 36%; aspect-ratio: 1; border-radius: 50%;
    background: rgba(233, 69, 96, 0.18);
    border: 1.5px solid rgba(233, 69, 96, 0.35);
  }
  .title-slide .circle-bottom-right {
    position: absolute; bottom: -6%; right: 6%;
    width: 20%; aspect-ratio: 1; border-radius: 50%;
    background: rgba(15, 52, 96, 0.55);
    border: 1.5px solid rgba(15, 52, 96, 0.7);
  }
  .title-slide .bottom-line {
    position: absolute; bottom: 10%; left: 0;
    width: 100%; height: 0.9%;
    background: #E94560;
  }
  .title-slide .content  { position: absolute; top: 18%; left: 5%; width: 75%; }
  .title-slide .main-title {
    font-size: calc(3.2 * var(--k)); font-weight: 700; color: #FFFFFF;
    line-height: 1.15; margin: 0 0 2.5% 0;
  }
  .title-slide .subtitle { font-size: calc(1.4 * var(--k)); color: #AABBCC; margin: 0 0 4% 0; }
  .title-slide .divider  {
    width: 18%; height: 0.5%; background: #E94560;
    margin-bottom: 3%; border-radius: 2px;
  }
  .title-slide .method   { font-size: calc(1.5 * var(--k)); color: #AABBCC; font-style: italic; }
  .title-slide .footer   { position: absolute; bottom: 3%; left: 5%; font-size: calc(1.1 * var(--k)); color: #556677; }

  /* ---------- Boîte bleue mise en avant ---------- */
  .slide .highlight-box {
    background: #0F3460;
    border-radius: 8px;
    border: 2px solid #E94560;
    color: #FFFFFF;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    box-sizing: border-box;
    padding: 0 3%;
  }
  .slide .highlight-box .label {
    font-size: calc(1.1 * var(--k)); font-weight: 700; color: #E94560; margin: 0 0 2% 0;
  }
  .slide .highlight-box .question {
    font-size: calc(1.3 * var(--k)); font-weight: 700; line-height: 1.6; margin: 0;
  }
  .slide .highlight-box .equations { font-size: calc(0.9 * var(--k)); }
  .slide .highlight-box .equations * { color: #FFFFFF; }

  /* ---------- Cartes ---------- */
  .slide .cards-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .slide .card {
    width: 30%; height: 100%;
    background: #FFFFFF;
    border-radius: 8px;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    overflow: hidden;
  }
  .slide .card-bar   { width: 100%; height: 12%; border-radius: 6px 6px 0 0; }
  .slide .card-title {
    font-size: calc(1.3 * var(--k)); font-weight: 700; color: #1A1A2E;
    text-align: center; margin: 8% 0 4% 0;
  }
  .slide .card-sub   { font-size: calc(1.0 * var(--k)); color: #7F8C8D; font-style: italic; text-align: center; }
  .slide .arrow      { font-size: calc(2.5 * var(--k)); color: #7F8C8D; }

  /* ---------- Mise en page en deux colonnes ---------- */
  .slide .two-columns {
    display: grid;
    grid-template-columns: 2fr 3fr;   /* colonne gauche : 40 %, droite : 60 % */
    gap: 3%;
    height: 100%;
    padding: 0 1%;
    box-sizing: border-box;
  }
  .slide .column-image {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 0;
  }
  .slide .column-image img {
    max-width: 100%;
    max-height: 75%;
    object-fit: contain;
  }
  .slide .caption {
    font-size: calc(1.0 * var(--k)); color: #7F8C8D; font-style: italic;
    text-align: center; margin: 4% 0 0 0;
  }

  /* ---------- Cartes « modèle » (nom + équations) ---------- */
  .slide .model-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    grid-auto-rows: 1fr;
    gap: 10px;
    min-height: 0;
  }
  .slide .model-card {
    background: #FFFFFF;
    border-radius: 8px;
    border-left: 4px solid #0F3460;
    box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    box-sizing: border-box;
    padding: 3% 4%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    overflow: hidden;
    min-height: 0;
  }
  .slide .model-name { font-size: calc(1.0 * var(--k)); font-weight: 700; margin: 0 0 2% 0; }
  .slide .model-eqs  { font-size: calc(0.7 * var(--k)); color: #1A1A2E; overflow-x: auto; }
  .slide .model-eqs .markdown, .slide .model-eqs p { margin: 0; padding: 0; }

  /* ---------- Mode présentation plein écran ---------- */
  .slide { cursor: zoom-in; }
  .slide-presenter { display: none; }
  .slide-presenter:fullscreen {
    display: flex;
    align-items: center;
    justify-content: center;
    background: #000;
  }
  .slide-presenter:fullscreen .slide {
    width: min(100vw, calc(100vh * 16 / 9));
    max-width: none;
    margin: 0;
    border-radius: 0;
    box-shadow: none;
    cursor: default;
  }
</style>

<script>
  // Double-clic sur une slide → plein écran.
  // ← / → (ou PageUp / PageDown / Espace) → slide précédente / suivante.
  // Échap → retour au notebook.
  const presenter = document.createElement("div");
  presenter.className = "slide-presenter";
  document.body.appendChild(presenter);
  let index = 0;

  const allSlides = () =>
    Array.from(document.querySelectorAll(".slide"))
      .filter(s => !presenter.contains(s));

  const show = (i) => {
    const slides = allSlides();
    if (i < 0 || i >= slides.length) return;
    index = i;
    presenter.replaceChildren(slides[i].cloneNode(true));
  };

  const onDblClick = (e) => {
    const s = e.target.closest(".slide");
    if (!s || presenter.contains(s)) return;
    show(allSlides().indexOf(s));
    presenter.requestFullscreen().catch(() => {});
  };

  const onKey = (e) => {
    if (document.fullscreenElement !== presenter) return;
    const n = allSlides().length;
    let target;
    if (["ArrowRight", "ArrowDown", "PageDown", " "].includes(e.key)) target = index + 1;
    else if (["ArrowLeft", "ArrowUp", "PageUp"].includes(e.key))     target = index - 1;
    else if (e.key === "Home") target = 0;
    else if (e.key === "End")  target = n - 1;
    else return;
    e.preventDefault();
    e.stopPropagation();
    show(target);
  };

  document.addEventListener("dblclick", onDblClick);
  document.addEventListener("keydown", onKey, true);

  // Nettoyage quand Pluto ré-exécute la cellule
  invalidation.then(() => {
    document.removeEventListener("dblclick", onDblClick);
    document.removeEventListener("keydown", onKey, true);
    presenter.remove();
  });
</script>
""")

# ╔═╡ 4ce5b8e5-4dbe-46a7-9735-50577a4cd162
# Composants réutilisables pour construire les slides.
begin
	"""
	    slide(title, body; footer=nothing, number=nothing)

	Slide standard : barres décoratives, bandeau de titre, contenu et pied de page optionnel.
	`body` peut être n'importe quel objet affichable (`@htl`, `md`, un graphique…).
	"""
	function slide(title, body; footer=nothing, number=nothing)
		@htl("""
		<div class="slide">
		  <div class="bar-top"></div>
		  <div class="bar-bottom"></div>
		  <div class="bar-left"></div>
		  <div class="slide-title">$title</div>
		  <div class="slide-body">$body</div>
		  $(footer === nothing ? nothing : @htl("<div class='slide-footer'>$footer</div>"))
		  $(number === nothing ? nothing : @htl("<div class='slide-number'>$number</div>"))
		</div>
		""")
	end

	"""
	    title_slide(title, subtitle, method; footer="", number=1)

	Slide de titre sur fond sombre.
	"""
	function title_slide(title, subtitle, method; footer="", number=1)
		@htl("""
		<div class="slide title-slide">
		  <div class="circle-top-right"></div>
		  <div class="circle-bottom-right"></div>
		  <div class="bottom-line"></div>
		  <div class="content">
		    <h1 class="main-title">$title</h1>
		    <p class="subtitle">$subtitle</p>
		    <div class="divider"></div>
		    <p class="method">$method</p>
		  </div>
		  <div class="footer">$footer</div>
		  <div class="slide-number">$number</div>
		</div>
		""")
	end

	"""
	    card(title, sub; color="#E94560")

	Carte blanche avec une barre de couleur en haut.
	Pour un retour à la ligne dans le titre : `card(@htl("Ligne 1<br>Ligne 2"), ...)`.
	"""
	card(title, sub; color="#E94560") = @htl("""
		<div class="card" style="border: 2px solid $color">
		  <div class="card-bar" style="background: $color"></div>
		  <p class="card-title">$title</p>
		  <p class="card-sub">$sub</p>
		</div>
		""")

	"Flèche entre deux cartes."
	arrow() = @htl("""<div class="arrow">→</div>""")

	"""
	    highlight_box(content; style="")

	Boîte bleue bordée de rouge. `style` sert à la positionner (largeur, hauteur, marges…).
	"""
	highlight_box(content; style="") = @htl("""
		<div class="highlight-box" style=$style>$content</div>
		""")

	"""
	    model_card(name, equations; color="#0F3460")

	Petite carte avec le nom d'un modèle (en couleur) et ses équations (un bloc `md`).
	"""
	model_card(name, equations; color="#0F3460") = @htl("""
		<div class="model-card" style="border-left-color: $color">
		  <p class="model-name" style="color: $color">$name</p>
		  <div class="model-eqs">$equations</div>
		</div>
		""")

	"""
	    image(path; alt="")

	Insère une image locale (chemin relatif au dossier du notebook), encodée en base64.
	Fonctionne même si le chemin contient des espaces, contrairement à `LocalResource`.
	"""
	function image(path; alt="")
		file = joinpath(@__DIR__, path)
		ext = lowercase(lstrip(splitext(file)[2], '.'))
		mime = ext == "svg" ? "image/svg+xml" : ext == "jpg" ? "image/jpeg" : "image/$ext"
		src = "data:$mime;base64," * base64encode(read(file))
		@htl("""<img src=$src alt=$alt>""")
	end

	nothing
end

# ╔═╡ 048e684e-d9df-11f1-8332-71bfd79ee45b
title_slide(
	"Estimation Robuste d'État",
	"pour les Systèmes Dynamiques Incertains",
	"Observateurs par Intervalles";
	footer = "Présentation ~ 8 minutes",
	number = 1,
)

# ╔═╡ 85d5c39a-99a7-4fc6-b6db-dee643027efc
let
	# ---------- Colonne gauche : schéma draw.io ----------
	# L'image est dans le dossier `images/` à côté du notebook.
	schema = image("images/modele.jpg"; alt = "Schéma du système")

	# ---------- Colonne droite : exemples de modèles EDO ----------
	# Les équations sont écrites en Markdown : Pluto les rend avec son propre MathJax.
	tumeur = md"""
	```math
	\begin{cases}
	s'(t) = \rho\left(1 - \frac{s(t)+m\,r(t)}{K}\right)s(t) - \alpha C\, s(t)\\
	r'(t) = \rho\left(1 - \frac{s(t)+m\,r(t)}{K}\right)r(t) - \beta \frac{s(t)}{K}\,r(t)
	\end{cases}
	```
	"""

	lotka_volterra = md"""
	```math
	\begin{cases}
	x'(t) = a\,x(t) - b\,x(t)\,y(t)\\
	y'(t) = c\,x(t)\,y(t) - d\,y(t)
	\end{cases}
	```
	"""

	sirs = md"""
	```math
	\begin{cases}
	S'(t) = -\beta S(t)\,I(t) + \gamma R(t)\\
	I'(t) = \beta S(t)\,I(t) - \delta I(t)\\
	R'(t) = \delta I(t) - \gamma R(t)
	\end{cases}
	```
	"""

	chemostat = md"""
	```math
	\begin{cases}
	s'(t) = D\,(s_{in} - s(t)) - k\,\mu(s(t))\,x(t)\\
	x'(t) = \big(\mu(s(t)) - D\big)\,x(t)
	\end{cases}
	```
	"""

	slide(
		"Système Dynamique Incertain",
		@htl("""
		<div class="two-columns">
		  <div class="column-image">
		    $schema
		    <p class="caption">Entrées → système → sorties mesurées</p>
		  </div>
		  <div class="model-grid">
		    $(model_card("Cellules sensibles / résistantes", tumeur;    color = "#E94560"))
		    $(model_card("Proie – prédateur (Lotka–Volterra)", lotka_volterra; color = "#F39C12"))
		    $(model_card("Épidémie (SIRS)",                   sirs;       color = "#2ECC71"))
		    $(model_card("Chémostat (bioprocédé)",           chemostat; color = "#0F3460"))
		  </div>
		</div>
		"""),
		number=2
	)
end

# ╔═╡ db7855c4-f570-4c77-80e7-d4b215d341a7
slide(
	"Le Problème Central",
	@htl("""
	$(highlight_box(
		@htl("""
		<p class="question">
		  Comment estimer l'état d'un système dynamique incertain
		  lorsque ses variables ne sont <u>PAS</u> directement mesurables ?
		</p>
		""");
		style = "height: 29%;",
	))
	<div class="cards-container" style="height: 53%; margin-top: 4%;">
	  $(card(@htl("Système<br>d'EDO"), "Variables cachées"; color = "#E94560"))
	  $(arrow())
	  $(card(@htl("Incertitudes<br>+ Bruits"), "Modèle imparfait"; color = "#F39C12"))
	  $(arrow())
	  $(card(@htl("Estimation<br>Robuste"), "Notre approche"; color = "#2ECC71"))
	</div>
	""");
	footer = "Un problème classique commun à de nombreux domaines scientifiques",
	number=3
)

# ╔═╡ 86be2eef-b800-4763-9867-4a55f0971e2c
slide(
	"Méthodes Classiques: Puissantes mais Limitées",
	@htl(""),
	number=4
)

# ╔═╡ 418d26e3-bb8f-4fac-a88f-2afcf3e856dc
slide(
	"Notre Solution : L'Observateur par Intervalles",
	@htl(""),
	number=5
)

# ╔═╡ e140e199-1483-4960-b25a-4fb98da48e30
let 
	observer_concept = image("images/observer_concept.png"; alt = "concept d'observateur")
	

	slide(
		"Qu'est ce qu'un observateur",
		@htl("""
		<div class="two-columns">
		  <div class="column-image">
		    $observer_concept
		    <p class="caption">fig: Concepte d'observateurs</p>
			  <p>Un observateur est donc un syteme dynamique dont l'entrée est une  </p>
		  </div>
		  <div class="model-grid">
		  </div>
		</div>
		"""),
		number=2
	)
end 

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Base64 = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~1.0.0"
PlutoUI = "~0.7.84"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.12.2"
manifest_format = "2.0"
project_hash = "af4bb0016c595f3f787a3e44885bcbd52796bf0f"

[[deps.AbstractPlutoDingetjes]]
git-tree-sha1 = "e71ee7b4aa06b045259a7d6101e1cb45ad140bce"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.4.1"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.2"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"
version = "1.11.0"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"
version = "1.11.0"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "af523e59de94de05b9b367a2ca4d63233aacd222"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.12.5"
weakdeps = ["StyledStrings"]

    [deps.ColorTypes.extensions]
    StyledStringsExt = "StyledStrings"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.3.0+1"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"
version = "1.11.0"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.7.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"
version = "1.11.0"

[[deps.FixedPointNumbers]]
deps = ["Random", "Statistics"]
git-tree-sha1 = "59af96b98217c6ef4ae0dfe065ac7c20831d1a84"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.6"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "179267cfa5e712760cd43dcae385d7ea90cc25a4"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.5"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "d1a86724f81bcd184a38fd284ce183ec067d71a0"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "1.0.0"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "0ee181ec08df7d7c911901ea38baf16f755114dc"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "1.0.0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"
version = "1.11.0"

[[deps.JuliaSyntaxHighlighting]]
deps = ["StyledStrings"]
uuid = "ac6e5ff7-fb65-4e79-a425-ec3bc9c03011"
version = "1.12.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.4"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "OpenSSL_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "8.15.0+0"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "OpenSSL_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.11.3+1"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"
version = "1.11.0"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
version = "1.12.0"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"
version = "1.11.0"

[[deps.MIMEs]]
git-tree-sha1 = "c64d943587f7187e751162b3b84445bbbd79f691"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "1.1.0"

[[deps.Markdown]]
deps = ["Base64", "JuliaSyntaxHighlighting", "StyledStrings"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"
version = "1.11.0"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2025.5.20"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.3.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.29+0"

[[deps.OpenSSL_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "3.5.4+0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Downloads", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "9869376035f47756b8b8e711fd0d06a06d51da6f"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.84"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"
version = "1.11.0"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"
version = "1.11.0"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"
version = "1.11.0"

[[deps.Statistics]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "e2b53ce13a53367e96601081e33d34746b571bad"
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"
version = "1.11.5"

    [deps.Statistics.extensions]
    SparseArraysExt = ["SparseArrays"]

    [deps.Statistics.weakdeps]
    SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.StyledStrings]]
uuid = "f489334b-da3d-4c2e-b8f0-e476e12c162b"
version = "1.11.0"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
version = "1.11.0"

[[deps.Tricks]]
git-tree-sha1 = "311349fd1c93a31f783f977a71e8b062a57d4101"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.13"

[[deps.URIs]]
deps = ["Serialization"]
git-tree-sha1 = "eb3b85ca904a1d1647b15acc091b113b8874b648"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.7.3"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"
version = "1.11.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
version = "1.11.0"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.3.1+2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.15.0+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.64.0+1"
"""

# ╔═╡ Cell order:
# ╟─01a49139-b2d9-48a2-b737-7685e6e3ea2a
# ╟─94a20083-978e-492b-b056-77ed64687cb5
# ╟─4ce5b8e5-4dbe-46a7-9735-50577a4cd162
# ╟─048e684e-d9df-11f1-8332-71bfd79ee45b
# ╟─85d5c39a-99a7-4fc6-b6db-dee643027efc
# ╟─db7855c4-f570-4c77-80e7-d4b215d341a7
# ╠═86be2eef-b800-4763-9867-4a55f0971e2c
# ╠═418d26e3-bb8f-4fac-a88f-2afcf3e856dc
# ╠═e140e199-1483-4960-b25a-4fb98da48e30
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
