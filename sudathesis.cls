% !Mode:: "TeX:UTF-8"
%%%%% 'sudathesis.cls' BEGIN

%%%%%%%%%%%% algorithm %%%%%%%%%%%%
\usepackage{algorithm}
\usepackage{algorithmic}
\floatname{algorithm}{算法}

% 提供 verbatiminput 命令和 comment 环境，按照源代码输出.
\usepackage{supertabular}

%%%%%%%%%%% 段落缩进 %%%%%%%%%%%%%%
%设置：全文段落都有缩进
\usepackage{indentfirst}
\let\@afterindentfalse\@afterindenttrue \@afterindenttrue

%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{sudathesis}
              [2012/07/06 v0.8
The LaTeX template for thesis of suda]
\typeout{Document Class `sudathesis' by CHAOJIAYUAN (2017/03)}

%%%%%%%%%% class options %%%%%%%%%%
% 模板
\newif\ifsuda@master\suda@mastertrue
\DeclareOption{master}{\suda@mastertrue}
\newif\ifsuda@color\suda@colorfalse
\DeclareOption{color}{\suda@colortrue}

% 其余选项传递给ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 引用ctexbook及基本设置
\LoadClass[zihao=-4,a4paper]{ctexbook}[2007/10/19]

%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包

\RequirePackage{ifthen}

%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}
% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
% \setCJKmainfont{SimSun}

% 斜楷体
\setCJKfamilyfont{hwxingkai}{STXingkai}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
 % windows 楷体
%\setCJKfamilyfont{kai}{KaiTi_GB2312}
% \setCJKfamilyfont{kai}{KaiTi}
\setCJKfamilyfont{kai}{FandolKai}

\newcommand{\kai}{\CJKfamily{kai}}
%windows 宋体
\setCJKfamilyfont{song}{FandolSong}
\newcommand\song{\CJKfamily{song}}

\newcommand{\xiaochuhao}{\fontsize{32pt}{\baselineskip}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}          % 小二, 1.5行距
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}            % 四号, 1.5 倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}  % 小四, 1.5倍行距


%%%%%%%%%% color %%%%%%%%%%
% 颜色设置

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面设置
\RequirePackage{geometry}
\newgeometry{
    top=3.3cm, bottom=2.7cm, left=2.75cm, right=2.75cm,
    headheight=2.6cm, %页眉高度，页眉距边界2.6cm
    headsep=0.4cm, %页眉到正文长度
    footskip=0.7cm, %页脚距边界2cm，2+0.7=(bottom)2.7cm
}
\savegeometry{mastergeometry}
\loadgeometry{mastergeometry}

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚设置

\let\ps@oldplain\ps@plain

\RequirePackage{fancyhdr}
\fancypagestyle{cnfrontmatter}{
    %\renewcommand{\headrulewidth}{0pt}
    %\renewcommand{\headrulewidth}{0pt}
    \fancyhf{}
    \fancyhead[RO]{\zihao{-5}\songti{摘~~~要}\vspace{0mm}}
    \fancyhead[LE]{\zihao{-5}\songti{摘~~~要}\vspace{0mm}}
    \fancyhead[LO,RE]{\zihao{-5}\songti\suda@thesistitle\vspace{0mm}}

    \fancyfoot[C]{\zihao{-5}\thepage}
}
\fancypagestyle{enfrontmatter}{
    %\renewcommand{\headrulewidth}{0pt}
    %\renewcommand{\headrulewidth}{0pt}
    \fancyhf{}
    \fancyhead[RO]{\zihao{-5}\songti{Abstract}\vspace{0mm}}
    \fancyhead[LE]{\zihao{-5}\songti{Abstract}\vspace{0mm}}
    \fancyhead[LO,RE]{\zihao{-5}\songti\suda@thesistitleeng\vspace{0mm}}

    \fancyfoot[C]{\zihao{-5}\thepage}
}

\fancypagestyle{mainmatter}{
    \fancyhead{}
    \fancyfoot{}
    \renewcommand{\headrulewidth}{0.5bp} % 页眉线宽度
    %leftmark是章名，rightmark是小节名
    \fancyhead[LE]{\zihao{-5}\songti\leftmark\vspace{0mm}}
    \fancyhead[RO]{\zihao{-5}\songti\leftmark\vspace{0mm}}
    \fancyhead[LO,RE]{\zihao{-5}\songti\suda@thesistitle\vspace{0mm}}

    \fancyfoot[C]{\zihao{-5}\thepage}

}

\fancypagestyle{plain}{
    \pagestyle{fancy}
    %\pagestyle{fancyplain} %使用fancyplain风格
    %\fancyfoot{} %清除页脚
}


%%%%%%%%%% space %%%%%%%%%%
% 其他间距

\linespread{1.5}\selectfont    %1.5行距
\setlength{\topskip}{0em}
\setlength{\parindent}{2em}  %首行缩进距离2个字符
\setlength{\parskip}{0.2\baselineskip}   %段间距
\setlength{\floatsep}{3pt plus 0.1pt minus 0.1pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 1pt} % 表格中的表与标题之间的距离


%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
\renewcommand{\contentsname}{目\qquad 录}
\renewcommand\listfigurename{插\ 图\ 目\ 录}
\renewcommand\listtablename{表\ 格\ 目\ 录}
\renewcommand\bibname{参\ 考\ 文\ 献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

% 格式
\ctexset{
    chapter={  %居中，小二黑体，段前后0.5行
        format={\centering\zihao{-2}\heiti},
        nameformat={},
        aftername={\quad},
        titleformat={},
        beforeskip={0em}, %长度，其绝对值表示标题到上文之间的距离
        afterskip={0.5\baselineskip},
    },
    section={ %左对齐，4号黑体，前后0.5行
        format={\raggedright\zihao{4}\heiti},
        aftername={\quad},
        beforeskip={0.5\baselineskip},
        afterskip={0.5\baselineskip},
    },
    subsection={ %左对齐，小4，楷体加粗，前后0.5行
        format={\raggedright\zihao{-4}\kai\textbf},
        aftername={\quad},
        beforeskip={0.5\baselineskip},
        afterskip={0.5\baselineskip},
    },
	subsubsection={ %左对齐，小4，黑体，前后0.3行
		format={\raggedright\zihao{-4}\heiti},
		name={,.},
		aftername={\,\,},
		indent={2em},
		number=\arabic{subsubsection},
		beforeskip={0.3\baselineskip},
		afterskip={0.3\baselineskip},
	},
}


%%%%%%%%%% contents %%%%%%%%%

\RequirePackage{titletoc}

\titlecontents{chapter}[0pt]{\vspace{-0.25\baselineskip}\heiti\zihao{4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.02\baselineskip}]
\titlecontents{section}[2em]{\vspace{-0.25\baselineskip}\songti\zihao{-4}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.01\baselineskip}]
\titlecontents{subsection}[4em]{\vspace{-0.25\baselineskip}\songti\zihao{5}}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}{\zihao{-4}\contentspage}}[\vspace{0.01\baselineskip}]

% 取消图片、表格目录中的章节空格
\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

%表目录图目录的格式设置
%表目录与图目录数字前增加“表”与“图”字，并且使目录行间距与section行间距一致

\titlecontents{figure}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{图~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

\titlecontents{table}[0pt]{\vspace{0.15\baselineskip}\songti\zihao{-4}}{\makebox[3em][l]{表~\thecontentslabel\quad}}{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}[\vspace{0.15\baselineskip}]

%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[xetex,unicode]{hyperref}
\ifsuda@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={SUDA thesis},
    pdfauthor={YANGYAOSHENG},
    pdfsubject={苏州大学硕士学位论文},
    pdfcreator={LaTeXed~By~YANGYAOSHENG}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献

\bibliographystyle{sudathesis} % 参考文献格式
\RequirePackage[sort&compress]{natbib}
\bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}
\setlength{\bibsep}{0pt}
\renewcommand{\citep}[1]{(\citet{#1})}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}


%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.eps,.ps,.jpg,.bmp}
\graphicspath{{figures/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subcaption}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setenumerate{fullwidth, itemindent=\parindent,listparindent=\parindent}  %首行缩进，第二行顶格
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=(\arabic*)}
%\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% code %%%%%%%%%%
% 代码

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{5}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
}
\ifsuda@color
    \lstset{
        numberstyle=\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
    }
\else
    \lstset{
        numberstyle=\color{black},
        keywordstyle=\color{black},
        commentstyle=\color{black},
        stringstyle=\color{black},
    }
\fi

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

%%%%%%%%%% theorem %%%%%%%%%%
% 定理

\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{remark}{注释}[chapter]
\newtheorem{problem}{问题}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}
\ifsuda@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{red}}
\fi

%%%%%%%%%% caption %%%%%%%%%%
% 图表标题的设置

\RequirePackage{caption}
\DeclareCaptionFormat{masterfigure}{\heiti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mastertable}{\heiti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterlstlisting}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}

\captionsetup[figure]{format=masterfigure,labelsep=quad}
\captionsetup[table]{format=mastertable,labelsep=quad}
\captionsetup[lstlisting]{format=masterlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}

%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 设置<附录>的图表编号与当前附录章号关联
\newcommand{\rmrelation}{
% 图、表、公式编号随 chapter 清零
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}
\@addtoreset{equation}{chapter}
%图、表、公式编号章节关联
\renewcommand{\thefigure}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand{\thetable}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand{\theequation}{\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
\oldappendix\rmrelation
}


% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

% 正文前的页码设置位大写罗马数字
\renewcommand{\frontmatter}{
    \cleardoublepage
    \@mainmatterfalse
    \pagenumbering{Roman}
}

% 保证偶数页结束章节
\newcommand{\clearemptydoublepage}{%
    \clearpage
    \if@twoside
        \ifodd
            \c@page
        \else
            \hbox{}\thispagestyle{empty}\newpage
            \if@twocolumn
                \hbox{}\newpage
            \fi
        \fi
    \fi
}

%%%%%%%%%% index %%%%%%%%%%
% 首页

% 本科生首页的右上角和底部的填写内容居中
% cvrtc : CoVer - Right  - Top    - Center
% cvcbc : CoVer - Center - Bottom - Center
\newcommand{\ulinecvrtc}[1]{\uline{\makebox[9em][c]{\bf #1}}}
\newcommand{\ulinecvcbc}[1]{\uline{\makebox[14em][c]{#1}}}

\newcommand\dlmu[2][4cm]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}

% 中文首页
\newcommand{\titlech}{
    \begin{titlepage}
        \hfill %居右
        \raisebox{-.2cm}[0pt][0pt]{
            \zihao{5}\heiti
            \begin{tabular}{l}
                学校代码：\bf\suda@unicode\\[.1ex]
                学\qquad 号：\bf\suda@studentID\\[.1ex]
            \end{tabular}
        }
        \vskip 20bp
        \begin{center}
            \includegraphics[width=200bp]{suda.ps}
            \vskip 20bp
            \centerline{\zihao{0}\songti 硕士学位论文}
            \vskip 10bp
            \centerline{\zihao{2}\songti （学术学位）}
            \includegraphics[width=130pt]{sudamark.jpg}
            ~~\\
            \vskip 20bp

            \begin{tabular}{p{0.5cm}p{9.2cm}}
                &\dlmu[9.2cm]{\zihao{4}\heiti{\suda@thesistitle}}\\ %[.4ex]%\hline
                &\dlmu[9.2cm]{} \\
                % english title 需要手动输入
                &\dlmu[9.2cm]{\zihao{4}{xxx-based xxx}} \\%[.4ex]
                &\dlmu[9.2cm]{} \\%[.4ex]
            \end{tabular}
            \vskip 20bp
            ~~\\
            {
                \zihao{4}\heiti
                \begin{tabular}{p{3cm}p{7cm}}
                    研~究~生~姓~名&\ulinecvcbc{\suda@thesisauthor}\\[.4ex]
                    指导教师姓名&\ulinecvcbc{\suda@teacher \quad \suda@subteacher}\\[.4ex]
                    专~~~业~~~名~~称&\ulinecvcbc{\suda@major}\\[.4ex]
                    研~~~究~~~方~~向&\ulinecvcbc{\suda@direct}\\[.4ex]
                    所~~~在~~~院~~部&\ulinecvcbc{\suda@school}\\[.4ex]
                    论文提交日期&\ulinecvcbc{\suda@thesisdateyear ~~年~~\suda@thesisdatemonth ~~月}\\[.4ex]
                \end{tabular}
            }
        \end{center}
    \end{titlepage}

}

% 英文首页
\newcommand{\titleeng}{
    \clearemptydoublepage
    \thispagestyle{empty}
    \vspace*{\stretch{1}}
    \begin{center}
    \begin{minipage}[h]{.8\textwidth}
    	\begin{spacing}{2}
        	\centering{\zihao{-2}\textbf{\suda@thesistitleeng}}
        \end{spacing}
    \end{minipage}
    \vskip 20bp
    \begin{minipage}[h]{.75\textwidth}
        \centering{\zihao{-3}\suda@thesissubtitleeng}
    \end{minipage}
    \vspace*{\stretch{1}}
    ~~\\
        {\zihao{4}A Dissertation Submitted for the Degree of \suda@degreeeng}\\
        \vskip 110bp
        \begin{center}
            \zihao{-3}
            \ifsuda@twoteacher
                \begin{tabular}{rl}
                    \textbf{Candidate:\ }&\textbf{\suda@thesisauthoreng}\\[0.5ex]
                    \textbf{Supervisor:\ }&\textbf{\suda@teacherdegreeeng ~~\suda@teachereng}\\
                    ~~ & \textbf{\suda@subteacherdegreeeng ~~\suda@subteachereng}\\
                \end{tabular}
            \else
                \begin{tabular}{rl}
                    \textbf{Candidate:\ }&\textbf{\suda@thesisauthoreng}\\[0.5ex]
                    \textbf{Supervisor:\ }&\textbf{\suda@teacherdegreeeng ~~\suda@teachereng}\\
                \end{tabular}
            \fi
        \end{center}
        \vskip 125bp
        \zihao{3}{
        \suda@schooleng \\[1.8ex]
        \suda@universityeng , Beijing, China}
    \end{center}
}

%%%%%%%%%% abstract %%%%%%%%%%
% 摘要

% 中文摘要
\newenvironment{cabstract}{%
    \newpage
    \chapter*{\zihao{-2}{\suda@thesistitle}\\
    \vspace{2ex}
    \centerline{\heiti\zihao{-3}{摘~~~~要}}}
    %\vspace{5ex}
    \setlength{\parindent}{24bp}
    }{%
    %\vskip 21bp
    %{\heiti\zihao{-4} 关键词：}\suda@ckeyword
}


% 英文摘要
\newenvironment{eabstract}{%
    \newpage
    \chapter*{\zihao{-2}{TreeCRF-based High-Order Syntactic Parsing}\\
    \vspace{2ex}
    \centerline{\zihao{-3}{Abstract}}}
    \setlength{\parindent}{24bp}
    }{%
    %\vskip 21bp

%    {\bf\zihao{-4} Key words: }\suda@ekeyword
}


%%%%%%%%%% settings for custom pages %%%%%%%%%%
% 首页重定义
\renewcommand{\maketitle}{%
    \titlech
    \songti
    \zihao{-4}
    \clearemptydoublepage
}

%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息

% 学校名称
\def\suda@university{苏州大学}
\def\suda@universityeng{Soochow University}
\newcommand{\university}[2]{%
    \def\suda@university{#1}
    \def\suda@universityeng{#2}
}
% 学院
\def\suda@school{}
\def\suda@schooleng{}
\newcommand{\school}[2]{%
    \def\suda@school{#1}
    \def\suda@schooleng{#2}
}
% 专业
\def\suda@major{}
\def\suda@majoreng{}
\newcommand{\major}[2]{%
    \def\suda@major{#1}
    \def\suda@majoreng{#2}
}

% 方向
\def\suda@direct{}
\def\suda@directeng{}
\newcommand{\direct}[2]{%
    \def\suda@direct{#1}
    \def\suda@directeng{#2}
}
% 论文标题和副标题
\def\suda@thesistitle{}
\def\suda@thesissubtitle{}
\def\suda@thesistitleeng{}
\def\suda@thesissubtitleeng{}
\newcommand{\thesistitle}[2]{%
    \def\suda@thesistitle{#1}
    %\def\suda@thesissubtitle{#2}
    \def\suda@thesistitleeng{#2}
    %\def\suda@thesissubtitleeng{#4}
}
% 作者
\def\suda@thesisauthor{}
\def\suda@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\suda@thesisauthor{#1}
    \def\suda@thesisauthoreng{#2}
}
% 指导老师
\def\suda@teacher{}
\def\suda@teachereng{}
\newcommand{\teacher}[2]{%
    \def\suda@teacher{#1}
    \def\suda@teachereng{#2}
}
% 副指导老师
\def\suda@subteacher{}
\def\suda@subteachereng{}
\newcommand{\subteacher}[2]{%
    \def\suda@subteacher{#1}
    \def\suda@subteachereng{#2}
}
% 分类号
\def\suda@category{}
\newcommand{\category}[1]{%
    \def\suda@category{#1}
}
% 论文开始时间
\def\suda@thesisbeginyear{}
\def\suda@thesisbeginmonth{}
\def\suda@thesisbeginday{}
\newcommand{\thesisbegin}[3]{%
    \def\suda@thesisbeginyear{#1}
    \def\suda@thesisbeginmonth{#2}
    \def\suda@thesisbeginday{#3}
}
% 论文结束时间
\def\suda@thesisendyear{}
\def\suda@thesisendmonth{}
\def\suda@thesisendday{}
\newcommand{\thesisend}[3]{%
    \def\suda@thesisendyear{#1}
    \def\suda@thesisendmonth{#2}
    \def\suda@thesisendday{#3}
}
% 答辩时间
\def\suda@defenseyear{}
\def\suda@defensemonth{}
\def\suda@defenseday{}
\newcommand{\defense}[3]{%
    \def\suda@defenseyear{#1}
    \def\suda@defensemonth{#2}
    \def\suda@defenseday{#3}
}
% 中文摘要关键字
\def\suda@ckeyword{}
\newcommand{\ckeyword}[1]{%
    \def\suda@ckeyword{#1}}
% 英文摘要关键字
\def\suda@ekeyword{}
\newcommand{\ekeyword}[1]{%
    \def\suda@ekeyword{#1}}
% 学位
\def\suda@degree{} % 中文首页和题名页
\def\suda@degreeeng{} % 英文首页
\def\suda@headdegree{} % 页眉页脚
\newcommand{\degree}[3]{%
    \def\suda@degree{#1}
    \def\suda@degreeeng{#2}
    \def\suda@headdegree{#3}
}

\degree{硕士学位}{Master}{硕士}


%%%%%%%%%% master user info %%%%%%%%%%

% 班级
\def\suda@class{}
\newcommand{\class}[1]{%
    \def\suda@class{#1}
}
% 单位代码
\def\suda@unicode{1006}
\newcommand{\unicode}[1]{%
    \def\suda@unicode{#1}
}
% 学号
\def\suda@studentID{}
\newcommand{\studentID}[1]{%
    \def\suda@studentID{#1}
}
% 论文时间
\def\suda@thesisdateyear{}
\def\suda@thesisdatemonth{}
\newcommand{\thesisdate}[2]{%
    \def\suda@thesisdateyear{#1}
    \def\suda@thesisdatemonth{#2}
}


% 保密等级
\def\suda@mibao{}
\newcommand{\mibao}[1]{%
    \def\suda@mibao{#1}
}
% 研究方向
\def\suda@direction{}
\newcommand{\direction}[1]{
    \def\suda@direction{#1}
}
% 导师职称
\def\suda@teacherdegree{}
\def\suda@teacherdegreeeng{}
\newcommand{\teacherdegree}[2]{%
    \def\suda@teacherdegree{#1}
    \def\suda@teacherdegreeeng{#2}
}
% 副导师职称
\def\suda@subteacherdegree{}
\def\suda@subteacherdegreeeng{}
\newcommand{\subteacherdegree}[2]{%
    \def\suda@subteacherdegree{#1}
    \def\suda@subteacherdegreeeng{#2}
}
% 申请学位级别(题名页)
\def\suda@appdegree{}
\newcommand{\applydegree}[1]{%
    \def\suda@appdegree{#1}
}
% 论文编号
\def\suda@thesisID{}
\newcommand{\thesisID}[1]{%
    \def\suda@thesisID{#1}
}
% 论文提交时间
\def\suda@commityear{}
\def\suda@commitmonth{}
\def\suda@commitday{}
\newcommand{\commit}[3]{%
    \def\suda@commityear{#1}
    \def\suda@commitmonth{#2}
    \def\suda@commitday{#3}
}
% 授予学位时间
\def\suda@awardyear{}
\def\suda@awardmonth{}
\def\suda@awardday{}
\newcommand{\award}[3]{%
    \def\suda@awardyear{#1}
    \def\suda@awardmonth{#2}
    \def\suda@awardday{#3}
}

%%%%% 'sudathesis.cls' %%%%% END
