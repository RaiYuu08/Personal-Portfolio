# Prince Paul Reymond M Caparida — Personal Portfolio

CCC181: Application Development and Emerging Technologies · Laboratory 1.

## Project description

I am **Prince Paul Reymond M Caparida**, a third-year Information Technology student majoring in Network Systems. I created this personal portfolio for CCC181 Laboratory 1 to introduce myself, showcase my skills and projects, and share my interests in SOC operations, threat detection, defensive security, and networking.

My portfolio includes my profile summary, skills and technologies, projects and achievements, and links to my LinkedIn and GitHub accounts. I featured **Compute Passport**, an **AI-Assisted Environmental Assurance & Disclosure Platform**, as well as this portfolio project.

**My tech stack:** HTML5, responsive CSS, Bonezegei Scripting Language (BSL) **v1.3.3**, the BSL `http` library, Git, and GitHub. I kept the CSS inside the HTML so the server can serve the entire page without additional asset routes. I used system fonts and CSS artwork so the page can render without loading external assets.

## Repository setup

I started by cloning the course reference repository:

```powershell
git clone https://github.com/msuiit-ph/BSL_HTTP_and_WebSocket.git
cd BSL_HTTP_and_WebSocket
```

I created my own public repository at [RaiYuu08/Personal-Portfolio](https://github.com/RaiYuu08/Personal-Portfolio), kept the reference repository as `upstream`, and connected my repository as `origin`:

```powershell
git remote rename origin upstream
git remote add origin https://github.com/RaiYuu08/Personal-Portfolio.git
git push -u origin main
```

I completed these steps and pushed my project to GitHub. I can check the remote configuration with `git remote -v`. I preserved the reference project's MIT license and copyright notice in [LICENSE](LICENSE).

## Setup & execution steps

### 1. Install BSL v1.3.3

The lab requires **Bonezegei Scripting Language v1.3.3**. On Windows, it can be installed through the Microsoft Store or the official Windows MSI, as described in the [installation guide](https://bonezegei.com/tutorials/bsl/install).

I checked my interpreter version in PowerShell:

```powershell
bonezegei -v
```

My interpreter reported `Bonezegei Script Interpreter v1.3.3`.

**My local setup:** I used the official [v1.3.3 Windows MSI](https://raw.githubusercontent.com/bonezegei/Bonezegei_Scripting_Language/v1.3.3/Release/Latest/Bonezegei-x86.msi) and extracted the runtime into `.tools/bsl`. I excluded this directory from Git because the runtime can be downloaded separately. These commands reproduce my local setup from the repository root:

```powershell
New-Item -ItemType Directory -Force .tools | Out-Null
Invoke-WebRequest 'https://raw.githubusercontent.com/bonezegei/Bonezegei_Scripting_Language/v1.3.3/Release/Latest/Bonezegei-x86.msi' -OutFile '.tools/BSL-1.3.3.msi'
$installerPath = Join-Path $PWD '.tools/BSL-1.3.3.msi'
$runtimeTarget = Join-Path $PWD '.tools/bsl'
Start-Process msiexec.exe -ArgumentList @('/a', ('"' + $installerPath + '"'), '/qn', ('TARGETDIR="' + $runtimeTarget + '"')) -WindowStyle Hidden -Wait
$env:PATH = "$PWD\.tools\bsl\Bonezegei;" + $env:PATH
bonezegei -v
```

The PATH change applies only to the current terminal session.

### 2. Configure VS Code

I opened my repository in VS Code and used the **Bonezegei Scripting Language Formatter**, ID `bonezegei-dev.vscode-bonezegei-formatter`. It can be installed from the Extensions panel (`Ctrl+Shift+X`). I also included it in `.vscode/extensions.json` as a recommended extension.

### 3. Install dependencies

I installed my project's dependencies from the VS Code terminal in the directory containing `package.json`:

```powershell
bzg install
```

This installed the HTTP library into `lib/`. I excluded the generated dependency directory from Git because `bzg install` can recreate it. I used the BSL package manager for this project.

### 4. Start the server

```powershell
bzg run
```

I used `bzg run` to execute [app.bzg](app.bzg), load `lib/http.bzg`, and start my HTTP server on **port 8000**. The BSL VS Code extension's Run button is another option once the interpreter is available to VS Code.

For my local setup, I included a launch helper that sets PATH, prints the version, installs dependencies if missing, and runs `bzg run`. This is the command I use to launch my portfolio:

```powershell
.\scripts\start-lab.ps1
```

I keep the terminal running while viewing my portfolio at **[http://localhost:8000](http://localhost:8000)**. I stop the server with `Ctrl+C` when I am finished.

### 5. Customize the page

I customized [public/index.html](public/index.html) with my name, profile summary, skills, projects, and social links. I added responsive styles for desktop and mobile layouts. To see changes, I save the file and refresh my browser. My server serves the portfolio at `/` and the fallback page at other paths. I retained the reference server's WebSocket handlers, although my static portfolio does not use them.

### 6. Commit and push

I save my changes to my public GitHub repository using Git:

```powershell
git add public/index.html app.bzg package.json README.md .gitignore .vscode scripts docs
git commit -m "Build personal portfolio and document BSL lab setup"
git push
```

## Execution verification

I verified my portfolio using the BSL v1.3.3 interpreter and HTTP dependency. My checks are recorded below.

| Check | Result |
| --- | --- |
| Interpreter | BSL v1.3.3, Windows |
| VS Code formatter | Installed |
| `bzg install` | HTTP dependency installed for x86 |
| `bzg run` | Portfolio served on port 8000 |
| GET `/` | HTTP 200 and correct portfolio content |
| Missing URL | Reference fallback content returned |
| Internal links | All anchors resolve to section IDs |
| Package manifest | Valid JSON and MIT license declared |
| Browser screenshot | Captured locally; image still needs to be added to this repository |
| Repository visibility | Public, verified through GitHub API |

The fallback displays a 404 page; its HTTP status is inherited from the library and is not asserted to be HTTP 404.

### Terminal screenshot

My terminal verification shows the BSL v1.3.3 runtime, dependency installation, and server execution:

![BSL terminal execution](docs/screenshots/terminal.png)

### Browser screenshot

I captured my portfolio running at `http://localhost:8000`, with the browser address bar visible. I still need to save that image as `docs/screenshots/browser.png` and embed it here before submission.

## Project structure

```text
Personal-Portfolio/
├── app.bzg                 # HTTP server and inherited WebSocket handlers
├── package.json            # BSL dependency manifest
├── public/
│   ├── index.html          # Portfolio and embedded CSS
│   └── 404.html            # Reference fallback page
├── scripts/start-lab.ps1   # Windows launch helper
├── .vscode/extensions.json # Recommended BSL extension
├── docs/screenshots/       # Execution evidence
├── .gitignore              # Runtime, generated dependencies, logs
├── LICENSE                 # Original MIT license and attribution
└── README.md
```

## Troubleshooting

- **Commands not recognized:** reopen your terminal after BSL installation, or use the local-runtime helper. A fresh clone does not include `.tools/`.
- **Missing `lib/http.bzg`:** run `bzg install` in the repository root.
- **Port 8000 occupied:** stop the previous server with `Ctrl+C` before starting another.
- **Browser cannot connect:** keep `bzg run` active and use HTTP, not HTTPS or a file URL.
- **Old content displayed:** save the HTML and refresh; use `Ctrl+F5` to bypass the browser cache.

## Content sources & attribution

The profile summary, year level, major, skills, and project descriptions reflect my background and interests. I linked [my LinkedIn profile](https://www.linkedin.com/in/prince-paul-caparida-85871431b/) as my primary contact channel.

For Compute Passport, I contributed to mobile development and served as my team's pitcher. Our team earned 1st Runner-Up at IEEE R10 SUMPAI 2026. I linked [our team's public announcement](https://lnkd.in/p/eyYrQnzv) in my portfolio.

I based my server on the [MSU-IIT reference repository](https://github.com/msuiit-ph/BSL_HTTP_and_WebSocket) and used [Bonezegei Scripting Language](https://github.com/bonezegei/Bonezegei_Scripting_Language) as the runtime.

## Submission

My submission link is **https://github.com/RaiYuu08/Personal-Portfolio**. Before submitting it to the official CCC181 Section 3 Laboratory 1 activity on MOLE, I will make sure both required screenshots are included and display correctly on GitHub.

## License

My project uses the MIT license. I preserved the reference project's original copyright notice in [LICENSE](LICENSE).
