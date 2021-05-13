% definição da classe e versão
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{propesp}[2021/03/09 FORMULÁRIO PARA SOLICITAÇÃO DE CREDENCIAMENTO DE PROJETO DE PESQUISA ISOLADO, PqI, E PROJETO DE PESQUISA ESPECIAL, PqE | RELATÓRIO TÉCNICO FINAL (RTF) | PROPESP/UNICENTRO]


% flags de controle
\newif\ifprojeto
\projetofalse
\newif\ifrelatorio
\relatoriofalse
\newif\ifpqi	
\pqifalse
\newif\ifpqe	
\pqefalse
\newif\iftide	
\tidefalse

\DeclareOption{projeto}{\projetotrue}
\DeclareOption{relatorio}{\relatoriotrue}
\DeclareOption{pqi}{\pqitrue}
\DeclareOption{pqe}{\pqetrue}
\DeclareOption{tide}{\tidetrue}

% metadados: inclui metadados no PDF
\DeclareOption{metadados}{\metadatatrue}

% demais opções devem ser encaminhadas à classe de base (book)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

% processa as opcoes definidas acima
\ProcessOptions

\LoadClass[
	% -- opções da classe memoir --
	article,			% indica que é um artigo acadêmico
	11pt,				% tamanho da fonte
	oneside,			% para impressão apenas no recto. Oposto a twoside
	a4paper,			% tamanho do papel. 
]{memoir}

\renewcommand{\thesection}{\arabic{section}}
\setsecnumdepth{subsubsection}	

% suporte a texto com múltiplas linguas
\RequirePackage{babel}
\RequirePackage{iflang}
\RequirePackage{etoolbox}

\AfterEndPreamble{
    \IfLanguageName{brazilian}
    {
        \renewcommand{\sectionautorefname}{Seção}
        \renewcommand{\subsectionautorefname}{Seção}
        \renewcommand{\subsubsectionautorefname}{Seção}
    }
    {
        \renewcommand{\sectionautorefname}{Section}
        \renewcommand{\subsectionautorefname}{Section}
        \renewcommand{\subsubsectionautorefname}{Section}
    }
    \bibliographystyle{apalike-ptbr}	% [Hild et al., 2006]
    \renewcommand{\bibsection}{\section{Referências}}
}

\def\@titulo{}      			% título
\def\@proponente{}	        	% proponente
\def\@email{}	        	    % email do proponente
\def\@endereco{}	       	    % email do proponente
\def\@telefone{}	        	% telefone do proponente
\def\@setor{}			        % setor de conhecimento
\def\@departamento{}	        % departamento pedagógico
\def\@campus{}			        % campus
\def\@regimetrabalho{}	        % regime de trabalho
\def\@iniciocredenciamento{}	% início do credenciamento (dia/mês/ano)
\def\@fimcredenciamento{}       % fim do credenciamento (dia/mês/ano)
\def\@numeroprotocolo{}         % número de protocolo do projeto
\def\@grupopesquisa{}           % grupo de pesquisa CNPq
\def\@linhapesquisa{}           % linha de pesquisa dentro do grupo
\def\@grandearea{}              % grande área de pesquisa
\def\@area{}                    % área de pesquisa
\def\@subarea{}                 % subárea de pesquisa
\def\@cidade{}                  % subárea de pesquisa
\def\@inicioexecucao{}	        % início da execução do projeto (dia/mês/ano)
\def\@fimexecucao{}             % fim da execução do projeto (dia/mês/ano)


% comandos para definir no main.tex
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\proponente}[1]{\def\@proponente{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\pendereco}[1]{\def\@endereco{#1}} % \endereco conflita por causa do \end
\newcommand{\telefone}[1]{\def\@telefone{#1}}
\newcommand{\setor}[1]{\def\@setor{#1}}
\newcommand{\departamento}[1]{\def\@departamento{#1}}
\newcommand{\campus}[1]{\def\@campus{#1}}
\newcommand{\regimetrabalho}[1]{\def\@regimetrabalho{#1}}
\newcommand{\iniciocredenciamento}[1]{\def\@iniciocredenciamento{#1}}
\newcommand{\fimcredenciamento}[1]{\def\@fimcredenciamento{#1}}
\newcommand{\inicioexecucao}[1]{\def\@inicioexecucao{#1}}
\newcommand{\fimexecucao}[1]{\def\@fimexecucao{#1}}
\newcommand{\numeroprotocolo}[1]{\def\@numeroprotocolo{#1}}
\newcommand{\grupopesquisa}[1]{\def\@grupopesquisa{#1}}
\newcommand{\linhapesquisa}[1]{\def\@linhapesquisa{#1}}
\newcommand{\grandearea}[1]{\def\@grandearea{#1}}
\newcommand{\area}[1]{\def\@area{#1}}
\newcommand{\subarea}[1]{\def\@subarea{#1}}
\newcommand{\cidade}[1]{\def\@cidade{#1}}

%------------------------------------------------------------------------------

% CONTROLE DO PDF GERADO

% pacotes para gerar um arquivo PDF "rico" (bookmarks, links, metadados)
\RequirePackage[plainpages,pdfpagelabels]{hyperref}	% PDF com links, metadados
\RequirePackage{bookmark}				% cria um índice no PDF

% Configurações de aparência do PDF final
% alterando o aspecto da cor azul
\RequirePackage{xcolor}
\@ifpackageloaded{xcolor}{%
	\PassOptionsToPackage{table,xcdraw,dvipsnames*,svgnames}{xcolor}% usenames,dvipsnames*,svgnames | dvipsnames,table,xcdraw
}{%
	\RequirePackage[table,xcdraw,dvipsnames*,svgnames]{xcolor}% usenames,dvipsnames*,svgnames | dvipsnames,table,xcdraw
}
\definecolor{blue}{RGB}{41,5,195}

% ajustar metadados e propriedades do PDF gerado

\hypersetup{
     	%pagebackref=true,
		pdftitle={\@titulo}, 
		pdfauthor={\@proponente},
    	pdfsubject={Projeto de Pesquisa Isolada - PqI},
	    pdfcreator={LaTeX},
		pdfkeywords={projeto de pesquisa}, 
		colorlinks=true,       		% false: boxed links; true: colored links
    	linkcolor=blue,          	% color of internal links
    	citecolor=blue,        		% color of links to bibliography
    	filecolor=magenta,      		% color of file links
		urlcolor=blue,
		bookmarksdepth=4
        hypertexnames = false,
        pdfview     = XYZ,
        pdfborder   = {0 0 0},
        anchorcolor = blue,
        breaklinks  = true,            %3		
}

% ajustar dimensões da página e margens

\RequirePackage{geometry}
\geometry{a4paper}
\geometry{left=2.5cm,right=1.5cm,top=1.25cm,bottom=8cm}
\geometry{bindingoffset=1cm}

\setsecheadstyle{\bfseries\rmfamily}   
\setsubsecheadstyle{\bfseries\rmfamily}

\RequirePackage[brazilian,hyperpageref]{backref} % Paginas com as citações na bibl

% Configurações do pacote backref
% Usado sem a opção hyperpageref de backref
\renewcommand{\backrefpagesname}{Citado na(s) página(s):~}

% Texto padrão antes do número das páginas
\renewcommand{\backref}{}

% Define os textos da citação
\renewcommand*{\backrefalt}[4]{
	\ifcase #1 %
		Nenhuma citação no texto.%
	\or
		Citado na página #2.%
	\else
		Citado #1 vezes nas páginas #2.%
	\fi}%

% % Altera as margens padrões
% \setlrmarginsandblock{2.5cm}{1.5cm}{*}
% \setulmarginsandblock{6.0cm}{6.0cm}{*}
% \checkandfixthelayout

% Espaçamentos entre linhas e parágrafos 

% O tamanho do parágrafo é dado por:
\setlength{\parindent}{1.3cm}

% Controle do espaçamento entre um parágrafo e outro:
\setlength{\parskip}{0.2cm}  % tente também \onelineskip

% Espaçamento simples
\SingleSpacing
\newenvironment{anexov}
{
    \begin{center}
    \textbf{ANEXO V, DO REGULAMENTO DE PESQUISA DA UNIVERSIDADE ESTADUAL DO CENTRO-OESTE, UNICENTRO}
    
    \textbf{FORMULÁRIO PARA SOLICITAÇÃO DE CREDENCIAMENTO DE PROJETO DE PESQUISA ISOLADO, PqI, E PROJETO DE PESQUISA ESPECIAL, PqE}
    
    \end{center}
    
    \begin{flushleft}
    \textbf{I - Informações do pesquisador: \ifpqi PqI ( X ) PqE (  ) \else PqI (   ) PqE ( X ) \fi} \\
    Nome do pesquisador: \@proponente \\
    Departamento pedagógico ou setor de lotação: \@departamento \\
    Regime de Trabalho: \@regimetrabalho \\
    Período previsto do credenciamento: \@iniciocredenciamento~-~\@fimcredenciamento \\
    Grupo de pesquisa CNPq: \@grupopesquisa \\
    Nesta pesquisa será vinculado o Regime de TIDE: \iftide Sim ( X ) Não (  ) \else Sim (   ) Não ( X ) \fi
    \newline
    
    \textbf{II - Dados relativos à solicitação de credenciamento de Projeto de Pesquisa Isolado e Projeto de Pesquisa Especial}
    
    Grande área, área e subárea do PqI a ser credenciado (segundo tabela do Conselho Nacional de Desenvolvimento Científico e Tecnológico, CNPq) (site da UNICENTRO em: Pesquisa):
    
    \@grandearea \\
    \hspace{10mm}\@area \\
    \hspace{20mm}\@subarea
    \end{flushleft}
    
    \begin{flushright}
        \begin{minipage}[t]{0.5\textwidth}
            \begin{flushright}
                \vspace{5mm}
                \@cidade, \today
                \vspace{20mm}
            \end{flushright}
            \begin{center}
                \noindent\rule{\textwidth}{2pt}
                \vspace{5mm}
                \@proponente
            \end{center}
        \end{minipage}
    \end{flushright}
    \newpage
}
{}

\newenvironment{anexovi}
{
    \begin{center}
    \textbf{ANEXO VI, DO REGULAMENTO DE PESQUISA DA UNIVERSIDADE ESTADUAL DO CENTRO-OESTE, UNICENTRO}
    
    
    % \textbf{MODELO ESTRUTURADO PARA ELABORAÇÃO DE PROJETO DE PESQUISA ISOLADO, PqI, E PROJETO DE PESQUISA ESPECIAL, PqE}
    \textbf{\ifpqi PROJETO DE PESQUISA ISOLADO, PqI \else PROJETO DE PESQUISA ESPECIAL, PqE \fi}
    \end{center}
    \section{Dados do Projeto}
    \begin{flushleft}
    \textbf{PqI ( X ) PqE (   )}
    \newline
    \newline
    Título do projeto: \textbf{\@titulo}
    \newline
    \newline
    Proponente: \textbf{\@proponente}
    \newline
    \newline
    Departamento/setor de lotação: \textbf{\@departamento}
    \newline
    \newline
    Setor de Conhecimento: \textbf{\@setor}
    \newline
    \newline
    \textit{Campus}: \textbf{\@campus}
    \end{flushleft}    
}
{}


\newenvironment{anexoviii}
{
    \begin{center}
        \textbf{ANEXO VIII, DO REGULAMENTO DE PESQUISA DA UNIVERSIDADE ESTADUAL DO CENTRO-OESTE, UNICENTRO}\\
        \vspace{10mm}
        % \textbf{MODELO DE RELATÓRIO TÉCNICO FINAL, RTF} \\
        \textbf{RELATÓRIO TÉCNICO FINAL, RTF} \\
        \textbf{\ifpqi PqI ( X ) PqE (  ) \else PqI (   ) PqE ( X ) \fi} \\    
    \end{center}
    
    \chapter{Informações solicitadas}
    \begin{flushleft}
        \begin{enumerate}
            \setcounter{enumi}{1}
            \begin{enumerate}[\arabic{enumi}.\arabic{enumii}]
                \item Número do Protocolo do Projeto de Pesquisa: \@numeroprotocolo
                \item Título do PqI ou PqE: \emph{\@titulo}
                \item Dados cadastrais do proponente/coordenador (nome, endereço, telefone, e-mail e departamento): \\
                Proponente/Coordenador: \@proponente~(\@email) \\
                Endereço: \@endereco \\
                Telefone: \@telefone \\
                Departamento: \@departamento
                \item Período de execução do PqI ou PqE: \@inicioexecucao~-~\@fimexecucao \\
                \item Número da resolução de aprovação do PqI ou PqE:
                \item Área e subárea de pesquisa, segundo a tabela do Conselho Nacional de Desenvolvimento Científico, CNPq: \\
                    \@grandearea \\
                    \hspace{10mm}\@area \\
                    \hspace{20mm}\@subarea
                \item Grupo de Pesquisa: \@grupopesquisa
                \item Linha de Pesquisa: \@linhapesquisa
            \end{enumerate}
        \end{enumerate}
    \end{flushleft}
    
    \begin{flushright}
        \begin{minipage}[t]{0.5\textwidth}
            \begin{flushright}
                \vspace{5mm}
                \@cidade, \today
                \vspace{20mm}
            \end{flushright}
            \begin{center}
                \noindent\rule{\textwidth}{2pt}
                \vspace{5mm}
                \@proponente
            \end{center}
        \end{minipage}
    \end{flushright}
    \newpage
}
{}

%%criar um novo estilo de cabeçalhos e rodapés
\AfterEndPreamble{
    \makepagestyle{propespstyle}
    %%cabeçalhos
    \makeoddhead{propespstyle} %%pagina ímpar ou com oneside
    {\includegraphics[height=1.93cm]{logo}}
    {}
    {
    \sffamily
    \begin{center}
        \fontsize{19}{19}\selectfont
        \textbf{Universidade Estadual do Centro-Oeste} \\
        \fontsize{8}{8}\selectfont
        Reconhecida pelo Decreto Estadual nº 3.444, de 8 de agosto de 1997
    \end{center}
    }
    \makeheadrule{propespstyle}{\textwidth}{\normalrulethickness} %linha
    
    \makeoddfoot{propespstyle} %%pagina ímpar ou com oneside
     {} %%pagina par
     {
        \parbox{\textwidth}{\raggedleft\thepage\\[\baselineskip] 
        \fontsize{7}{11}\selectfont
        \sffamily
        \centering
        Home Page: http://www.unicentro.br
        \\[\baselineskip] 
        Campus Santa Cruz: Rua Pres. Zacarias 875 – Cx. Postal 3010 – Fone: (42) 3621-1000 – FAX: (42) 3621-1090 – CEP 85.015-430 – GUARAPUAVA – PR
        
        Campus CEDETEG: Rua Simeão Camargo Varela de Sá, 03 – Fone/FAX: (42) 3629-8100 – CEP 85.040-080 – GUARAPUAVA – PR
        
        Campus de Irati: PR 153 – Km 07 – Riozinho – Cx. Postal, 21 – Fone: (42) 3421-3000 – FAX: (42) 3421-3067 – CEP 84.500-000 – IRATI – PR
        \hfill\null}     
    }
    {} 
    \setheadfoot{3cm}{5cm} % reverted my faulty edit
    \pagestyle{propespstyle}
}    
    
