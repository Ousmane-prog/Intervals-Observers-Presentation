### A Pluto.jl notebook ###
# v1.1.0

using Markdown
using InteractiveUtils

# ╔═╡ 01a49139-b2d9-48a2-b737-7685e6e3ea2a
begin 
	using PlutoUI
	using HypertextLiteral
end 

# ╔═╡ 048e684e-d9df-11f1-8332-71bfd79ee45b


@htl("""
<style>
  .slide1-wrapper {
    position: relative;
    width: 100%;
    aspect-ratio: 16 / 9;
    max-width: 900px;
    margin: 0 auto;
    background: #1A1A2E;
    border-radius: 12px;
    overflow: hidden;
    font-family: Calibri, 'Segoe UI', sans-serif;
    box-shadow: 0 8px 32px rgba(0,0,0,0.5);
  }

  .circle-top-right {
    position: absolute;
    top: -8%; right: -4%;
    width: 36%;
    aspect-ratio: 1;
    border-radius: 50%;
    background: rgba(233, 69, 96, 0.18);
    border: 1.5px solid rgba(233, 69, 96, 0.35);
  }

  .circle-bottom-right {
    position: absolute;
    bottom: -6%; right: 6%;
    width: 20%;
    aspect-ratio: 1;
    border-radius: 50%;
    background: rgba(15, 52, 96, 0.55);
    border: 1.5px solid rgba(15, 52, 96, 0.7);
  }

  .bottom-line {
    position: absolute;
    bottom: 10%; left: 0;
    width: 100%; height: 0.9%;
    background: #E94560;
  }

  .slide1-content {
    position: absolute;
    top: 18%; left: 5%;
    width: 75%;
  }

  .slide1-title {
    font-size: 3.2vw;
    font-weight: 700;
    color: #FFFFFF;
    line-height: 1.15;
    margin: 0 0 2.5% 0;
  }

  .slide1-subtitle {
    font-size: 1.4vw;
    color: #AABBCC;
    margin: 0 0 4% 0;
  }

  .slide1-divider {
    width: 18%; height: 0.5%;
    background: #E94560;
    margin-bottom: 3%;
    border-radius: 2px;
  }

  .slide1-method {
    font-size: 1.5vw;
    color: #AABBCC;
    font-style: italic;
  }

  .slide1-footer {
    position: absolute;
    bottom: 3%; left: 5%;
    font-size: 1.1vw;
    color: #556677;
  }

  .slide1-number {
    position: absolute;
    bottom: 3%; right: 2%;
    font-size: 1.1vw;
    color: #556677;
  }
</style>

<div class="slide1-wrapper">
  <div class="circle-top-right"></div>
  <div class="circle-bottom-right"></div>
  <div class="bottom-line"></div>

  <div class="slide1-content">
    <h1 class="slide1-title">Estimation Robuste d'État</h1>
    <p class="slide1-subtitle">pour les Systèmes Dynamiques Incertains</p>
    <div class="slide1-divider"></div>
    <p class="slide1-method">Observateurs par Intervalles</p>
  </div>

  <div class="slide1-footer">Présentation ~ 8 minutes</div>
  <div class="slide1-number">1</div>
</div>
""")

# ╔═╡ db7855c4-f570-4c77-80e7-d4b215d341a7
@htl("""
<style>
  .slide2-wrapper {
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
  }
   .bar-top {
     position: absolute; 
     top: 0; left: 0;
     width: 100%; height: 1.5%;
     background: #0F3460;
    }
   .bar-bottom {
     position: absolute;
     bottom: 0; left: 0;
     width: 100%; height: 1.5%;
     background: #0F3460;
   } 
  .bar-left {
     position: absolute;
     top: 1.5%; left: 0;
     width: 0.9%; height: 97%;
     background: #E94560;
   } 

  .slide2-title  {
     position: absolute;
     top: 1.5%; left: 2%;
     width: 96%; height: 12%;
     display: flex;
     align-items: center; 
     font-size: 2.2vw;
     font-weight: 700;
     background: #FFFFFF;
   } 
  .question-box  {
     position: absolute;
     top: 15%; left: 2%;
     width: 94%; height: 22%;
     background: #0F3460;
     border-radius: 8px;
     border: 2px solid #E94560;
     display: flex;
     align-items: center;
     justify-content: center;
   }
  .question-text {
    font-size: 1.3vw;
    font-weight: 700;
    color: #FFFFFF;
    text-align: center;
    line-height: 1.6;
    padding: 0 3%;
    margin: 0;
  }
</style>
<div class="slide2-wrapper">
    <div class="bar-top"> </div>
    <div class="bar-bottom"> </div>
    <div class="bar-left"> </div>
    <div class="slide2-title"> Le Probleme Centrale</div>
     
    <div class="question-box">
     <p class="question-text">
     Comment estimer l'état d'un système dynamique incertain
      lorsque ses variables ne sont <u>PAS</u> directement mesurables ?
    </p>
  </div>
     
</div>
""")

# ╔═╡ 86be2eef-b800-4763-9867-4a55f0971e2c


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
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
project_hash = "3f7a5bdf40b55b2c6f61522f5caec8fb2f2962b1"

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
# ╠═048e684e-d9df-11f1-8332-71bfd79ee45b
# ╠═db7855c4-f570-4c77-80e7-d4b215d341a7
# ╠═86be2eef-b800-4763-9867-4a55f0971e2c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
