\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{eleclab-report}[2026/04/23 SCUT electrical lab report template]

\LoadClass[12pt,a4paper,UTF8,fontset=none]{ctexart}

\RequirePackage{eleclab-fonts}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{geometry}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{xcolor}

\geometry{
  top=2.54cm,
  bottom=2.54cm,
  left=3.00cm,
  right=2.00cm,
  headheight=0pt,
  headsep=0pt,
  footskip=0pt
}

\setmainfont{\ElecLabLatinMainFont}
\setsansfont{\ElecLabLatinSansFont}
\setmonofont{\ElecLabLatinMonoFont}
\setCJKmainfont[
  BoldFont=\ElecLabBodyCJKFont,
  ItalicFont=\ElecLabBodyCJKFont,
  BoldItalicFont=\ElecLabBodyCJKFont,
  AutoFakeBold=2.8
]{\ElecLabBodyCJKFont}
\setCJKsansfont[
  BoldFont=\ElecLabHeadingCJKFont,
  ItalicFont=\ElecLabHeadingCJKFont,
  BoldItalicFont=\ElecLabHeadingCJKFont,
  AutoFakeBold=2.8
]{\ElecLabHeadingCJKFont}
\setCJKmonofont{\ElecLabBodyCJKFont}
\newCJKfontfamily\ElecLabBodyFont[
  BoldFont=\ElecLabBodyCJKFont,
  ItalicFont=\ElecLabBodyCJKFont,
  BoldItalicFont=\ElecLabBodyCJKFont,
  AutoFakeBold=2.8
]{\ElecLabBodyCJKFont}
\newCJKfontfamily\ElecLabHeadingFont[
  BoldFont=\ElecLabHeadingCJKFont,
  ItalicFont=\ElecLabHeadingCJKFont,
  BoldItalicFont=\ElecLabHeadingCJKFont,
  AutoFakeBold=2.8
]{\ElecLabHeadingCJKFont}

\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 0.8pt
\punctstyle{plain}

\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlength{\arrayrulewidth}{0.5pt}
\renewcommand{\arraystretch}{1.25}
\renewcommand{\cellalign}{cc}
\renewcommand{\cellgape}{\Gape[2pt]}
\renewcommand\tabularxcolumn[1]{m{#1}}

\makeatletter
\renewcommand\normalsize{%
  \@setfontsize\normalsize{10.5pt}{15.6pt}%
  \abovedisplayskip 8pt plus 2pt minus 4pt%
  \abovedisplayshortskip \z@ plus 2pt%
  \belowdisplayshortskip 6pt plus 2pt minus 3pt%
  \belowdisplayskip \abovedisplayskip
  \let\@listi\@listI
}
\normalsize
\makeatother

\AddToHook{shipout/background}{%
  \begin{tikzpicture}[remember picture,overlay]
    \draw[
      line width=0.9pt,
      dash pattern=on 5pt off 2.2pt on 1.2pt off 2.2pt
    ]
      ([xshift=9.9mm]current page.north west) --
      ([xshift=9.9mm]current page.south west);
  \end{tikzpicture}%
}

\newcounter{labmajor}
\newcounter{labminor}[labmajor]
\newcounter{labitem}[labminor]

\newcommand{\labresetitems}{\setcounter{labitem}{0}}

\newcommand{\labmajorfont}{\ElecLabBodyFont\fontsize{12pt}{15.6pt}\selectfont}
\newcommand{\labminorfont}{\ElecLabBodyFont\fontsize{10.5pt}{15.6pt}\selectfont}
\newcommand{\labtitlefont}{\ElecLabHeadingFont\fontsize{18pt}{22pt}\selectfont\bfseries}
\newcommand{\labtablefont}{\ElecLabBodyFont\fontsize{12pt}{15pt}\selectfont}

\newcommand{\ExperimentNumber}{}
\newcommand{\ExperimentTitle}{}
\newcommand{\StudentName}{}
\newcommand{\StudentNameB}{}
\newcommand{\StudentId}{}
\newcommand{\LabTimePlaceholder}{%
  20\hspace{0.35em}2\hspace{0.9em}年\hspace{1.2em}月\hspace{1.2em}日\hspace{0.7em}：\hspace{0.5em}\makebox[1.5em][c]{--}\hspace{0.5em}：%
}
\newcommand{\ExperimentDateTime}{\LabTimePlaceholder}
\newcommand{\ExperimentScore}{}
\newcommand{\PreviewRecord}{}
\newcommand{\InstructorName}{}

\newcommand{\setexperimentnumber}[1]{\renewcommand{\ExperimentNumber}{#1}}
\newcommand{\setexperimenttitle}[1]{\renewcommand{\ExperimentTitle}{#1}}
\newcommand{\setstudentname}[1]{\renewcommand{\StudentName}{#1}}
\newcommand{\setstudentnameb}[1]{\renewcommand{\StudentNameB}{#1}}
\newcommand{\setstudentid}[1]{\renewcommand{\StudentId}{#1}}
\newcommand{\setexperimentdatetime}[1]{\renewcommand{\ExperimentDateTime}{#1}}
\newcommand{\setexperimentscore}[1]{\renewcommand{\ExperimentScore}{#1}}
\newcommand{\setpreviewrecord}[1]{\renewcommand{\PreviewRecord}{#1}}
\newcommand{\setinstructorname}[1]{\renewcommand{\InstructorName}{#1}}

\newcommand{\labstrut}{\rule{0pt}{2.7ex}}
\newcommand{\LabEntryText}[1]{\raisebox{-1.5ex}[0pt][0pt]{#1}}
\newcommand{\LabBottomBox}[2]{%
  \vbox{\offinterlineskip
    \hbox to #1{\hfil\labstrut\LabEntryText{#2}\hfil}%
    \kern3ex
    \hrule height 0.5pt
  }%
}
\newcommand{\LabTopBottomBox}[2]{%
  \LabBottomBox{#1}{#2}%
}
\newcommand{\LabFill}[1]{\makebox[#1][c]{\strut}}
\newcommand{\LabBlank}[1]{\par\vspace*{#1}}
\newcommand{\LabCircledOne}{\raisebox{0.08ex}{\textcircled{\scriptsize 1}}}
\newcommand{\LabCircledTwo}{\raisebox{0.08ex}{\textcircled{\scriptsize 2}}}
\newcommand{\LabCircledThree}{\raisebox{0.08ex}{\textcircled{\scriptsize 3}}}

\newcommand{\makelabtitle}{%
  \begin{center}
    \vspace*{0.2\baselineskip}
    {\labtitlefont 实验\ExperimentNumber\hspace{1em}\ExperimentTitle\par}
  \end{center}
  \vspace{0.65\baselineskip}
}

\newlength{\LabHeaderWidth}
\setlength{\LabHeaderWidth}{15.24cm}
\newlength{\LabHeaderLeftLabelWidth}
\setlength{\LabHeaderLeftLabelWidth}{2.95cm}
\newlength{\LabHeaderRightLabelWidth}
\setlength{\LabHeaderRightLabelWidth}{1.86cm}

\newcommand{\LabHeaderLabel}[2]{%
  \makecell[c]{\bfseries \hbox to #1{#2}：}%
}

\newcommand{\LabHeaderNameLabel}{%
  \LabHeaderLabel{\LabHeaderLeftLabelWidth}{姓\hfil 名}%
}
\newcommand{\LabHeaderDateTimeLabel}{%
  \LabHeaderLabel{\LabHeaderLeftLabelWidth}{实\hfil 验\hfil 日\hfil 期\hfil 与\hfil 时\hfil 间}%
}
\newcommand{\LabHeaderPreviewLabel}{%
  \LabHeaderLabel{\LabHeaderLeftLabelWidth}{预\hfil 习\hfil 检\hfil 查\hfil 纪\hfil 录}%
}
\newcommand{\LabHeaderIdLabel}{%
  \LabHeaderLabel{\LabHeaderRightLabelWidth}{序\hfil 号}%
}
\newcommand{\LabHeaderScoreLabel}{%
  \LabHeaderLabel{\LabHeaderRightLabelWidth}{评\hfil 分}%
}
\newcommand{\LabHeaderInstructorLabel}{%
  \LabHeaderLabel{\LabHeaderRightLabelWidth}{实\hfil 验\hfil 教\hfil 师}%
}

\newcommand{\makelabheadertable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.1}
  \begin{center}
  {\labtablefont
  \begin{tabular}{@{}m{3.91cm}m{3.54cm}m{2.40cm}m{3.25cm}m{2.14cm}@{}}
    \LabHeaderNameLabel &
    \LabBottomBox{3.54cm}{\StudentName} &
    \LabBottomBox{2.40cm}{\StudentNameB} &
    \LabHeaderIdLabel &
    \LabBottomBox{2.14cm}{\StudentId} \\
    [1.05ex]
    \LabHeaderDateTimeLabel &
    \multicolumn{2}{m{5.94cm}@{}}{\centering\LabTopBottomBox{5.94cm}{\ExperimentDateTime}} &
    \LabHeaderScoreLabel &
    \LabTopBottomBox{2.14cm}{\ExperimentScore} \\
    [1.05ex]
    \LabHeaderPreviewLabel &
    \multicolumn{2}{m{5.94cm}@{}}{\centering\LabTopBottomBox{5.94cm}{\PreviewRecord}} &
    \LabHeaderInstructorLabel &
    \LabTopBottomBox{2.14cm}{\InstructorName}
  \end{tabular}}
  \end{center}
  \endgroup
  \vspace{1.2\baselineskip}
}

\newcommand{\LabMajorSection}[1]{%
  \par
  \vspace{0.55\baselineskip}%
  \refstepcounter{labmajor}%
  \setcounter{labminor}{0}%
  \setcounter{labitem}{0}%
  {\labmajorfont \chinese{labmajor}、#1\par}%
  \vspace{1.15\baselineskip}%
}

\newcommand{\LabMinorSection}[1]{%
  \par
  \vspace{0.1\baselineskip}%
  \refstepcounter{labminor}%
  \setcounter{labitem}{0}%
  {\labminorfont （\chinese{labminor}）#1\par}%
  \vspace{0.2\baselineskip}%
}

\newcommand{\LabItem}[1]{%
  \par
  \refstepcounter{labitem}%
  {\labminorfont \arabic{labitem}）#1\par}%
}

\newcommand{\LabMethod}[1]{%
  \par
  \vspace{0.15\baselineskip}%
  {\labminorfont #1\par}%
}

\newcommand{\LabWritingArea}[1]{%
  \par\vspace{0.25\baselineskip}%
  \vspace*{#1}%
  \par
}

\newcommand{\LabPlaceholderBlock}[2]{%
  \LabItem{#1}%
  \LabWritingArea{#2}%
}

\newcommand{\LabDataAnalysisBlock}[1]{%
  \LabItem{数据分析}%
  \LabWritingArea{#1}%
}

\newcolumntype{Y}[1]{>{\centering\arraybackslash\hsize=#1\hsize\linewidth=\hsize}X}
\newcolumntype{Z}[1]{>{\raggedright\arraybackslash\hsize=#1\hsize\linewidth=\hsize}X}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}
\newcommand{\LabUnitExpr}[2]{\makecell[c]{$#1/#2$}}
\newcommand{\LabTableBlank}{\rule{0pt}{2.8ex}}
\newcommand{\LabSplitHeaderCell}{\makecell[c]{}}
\newcommand{\LabTitledTable}[2]{%
  \begin{tabular}{@{}c@{}}
    {\labminorfont #1} \\
    [-0.15\baselineskip]
    #2
  \end{tabular}%
}
\newcommand{\LabComparisonTables}[4]{%
  \begin{tabular}{@{}c@{\hspace{0.9cm}}c@{}}
    {\labminorfont #1} & {\labminorfont #3} \\
    [-0.15\baselineskip]
    #2 & #4
  \end{tabular}%
}

\newcommand{\LabSuperpositionMeasuredGrid}{%
  \begin{tabular}{@{}C{4.10cm}*{6}{C{1.47cm}}@{}}
    \toprule
    \LabSplitHeaderCell &
    \LabUnitExpr{U_{AB}}{\mathrm{V}} &
    \LabUnitExpr{U_{BC}}{\mathrm{V}} &
    \LabUnitExpr{U_{CA}}{\mathrm{V}} &
    \LabUnitExpr{I_1}{\mathrm{mA}} &
    \LabUnitExpr{I_2}{\mathrm{mA}} &
    \LabUnitExpr{I_3}{\mathrm{mA}} \\
    \midrule
    \LabCircledOne $U_S$与$I_S$共同作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledTwo $I_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledThree $U_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    2$U_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledTwo+\LabCircledThree &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}
\newcommand{\LabSuperpositionTheoryGrid}{%
  \begin{tabular}{@{}C{4.10cm}*{6}{C{1.47cm}}@{}}
    \toprule
    \LabCircledOne $U_S$与$I_S$共同作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledTwo $I_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledThree $U_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    2$U_S$单独作用 &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){1-7}
    \LabCircledTwo+\LabCircledThree &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}

\newcommand{\LabOpenShortMeasuredGrid}{%
  \begin{tabular}{@{}C{1.72cm}C{1.72cm}C{1.90cm}@{}}
    \toprule
    \LabUnitExpr{U_{OC}}{\mathrm{V}} &
    \LabUnitExpr{I_{SC}}{\mathrm{mA}} &
    \LabUnitExpr{R_{eq1}}{\Omega} \\
    \midrule
    \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}
\newcommand{\LabOpenShortTheoryGrid}{%
  \begin{tabular}{@{}C{1.72cm}C{1.72cm}C{1.90cm}@{}}
    \toprule
    \LabUnitExpr{U_{OC}}{\mathrm{V}} &
    \LabUnitExpr{I_{SC}}{\mathrm{mA}} &
    \LabUnitExpr{R_{eq1}}{\Omega} \\
    \midrule
    \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}

\newcommand{\LabVoltAmpereMeasuredGrid}{%
  \begin{tabular}{@{}C{1.48cm}C{1.22cm}C{1.48cm}C{1.62cm}@{}}
    \toprule
    \LabUnitExpr{U_{OC}}{\mathrm{V}} &
    \LabUnitExpr{R}{\Omega} &
    \LabUnitExpr{U_R}{\mathrm{V}} &
    \LabUnitExpr{R_{eq2}}{\Omega} \\
    \midrule
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}
\newcommand{\LabVoltAmpereTheoryGrid}{%
  \begin{tabular}{@{}C{1.48cm}C{1.22cm}C{1.48cm}C{1.62cm}@{}}
    \toprule
    \LabUnitExpr{U_{OC}}{\mathrm{V}} &
    \LabUnitExpr{R}{\Omega} &
    \LabUnitExpr{U_R}{\mathrm{V}} &
    \LabUnitExpr{R_{eq2}}{\Omega} \\
    \midrule
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}

\newcommand{\LabDirectMethodMeasuredGrid}{%
  \begin{tabular}{@{}C{2.60cm}@{}}
    \toprule
    \LabUnitExpr{R_{eq3}}{\Omega} \\
    \midrule
    \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}
\newcommand{\LabDirectMethodTheoryGrid}{%
  \begin{tabular}{@{}C{2.60cm}@{}}
    \toprule
    \LabUnitExpr{R_{eq3}}{\Omega} \\
    \midrule
    \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}

\newcommand{\LabTheveninMeasuredGrid}{%
  \begin{tabular}{@{}C{1.69cm}C{1.69cm}*{5}{C{1.33cm}}@{}}
    \toprule
    \multicolumn{2}{c}{\LabUnitExpr{R}{\Omega}} & 100 & 200 & 300 & 390 & 510 \\
    \midrule
    \multirow{2}{*}{\LabUnitExpr{U_R}{\mathrm{V}}} & 图5.2.3a &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \cmidrule(lr){2-7}
    & 图5.2.3b &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \midrule
    \multicolumn{2}{c}{理论值} &
    \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank & \LabTableBlank \\
    \bottomrule
  \end{tabular}%
}

\newcommand{\LabSuperpositionTable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
  {\labtablefont
  \LabTitledTable{实测值}{\LabSuperpositionMeasuredGrid}\par
  \vspace{0.45\baselineskip}%
  \LabTitledTable{理论值}{\LabSuperpositionTheoryGrid}}
  \end{center}
  \endgroup
}

\newcommand{\LabOpenShortTable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
  {\labtablefont
  \LabComparisonTables{实测值}{\LabOpenShortMeasuredGrid}{理论值}{\LabOpenShortTheoryGrid}}
  \end{center}
  \endgroup
}

\newcommand{\LabVoltAmpereTable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
  {\labtablefont
  \LabComparisonTables{实测值}{\LabVoltAmpereMeasuredGrid}{理论值}{\LabVoltAmpereTheoryGrid}}
  \end{center}
  \endgroup
}

\newcommand{\LabDirectMethodTable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
  {\labtablefont
  \LabComparisonTables{实测值}{\LabDirectMethodMeasuredGrid}{理论值}{\LabDirectMethodTheoryGrid}}
  \end{center}
  \endgroup
}

\newcommand{\LabTheveninTable}{%
  \begingroup
  \setlength{\tabcolsep}{0pt}
  \renewcommand{\arraystretch}{1.15}
  \begin{center}
  {\labtablefont
  \LabTheveninMeasuredGrid}
  \end{center}
  \endgroup
}

\newenvironment{LabArabicList}{%
  \labminorfont
  \begin{enumerate}[label=\arabic*.,leftmargin=*,labelindent=0pt,labelsep=0.45em,align=left,itemsep=0.2ex,topsep=0.25ex,parsep=0pt]
}{%
  \end{enumerate}
}
