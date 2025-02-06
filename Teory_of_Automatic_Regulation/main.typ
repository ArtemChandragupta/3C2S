#set text(
  font: "Times New Roman",
  size: 14pt,
  lang: "ru"
)
#set page(
  paper: "a4",
  margin: (x: 1.5cm, y: 1.5cm),
  numbering: "1",
  number-align: right,
)
#set par(
  justify: true,
  first-line-indent: 1.25cm,
)

// Leading fix
#let leading = 1.5em
#let leading = leading - 0.75em // "Normalization"
#set block(spacing: leading)
#set par(spacing: leading)
#set par(leading: leading)

// Диаграммы
#import "@preview/cetz:0.3.1"
// Отступы на первой строчке
#import "@preview/indenta:0.0.3": fix-indent
// Физические формулы
#import "@preview/physica:0.9.4": *

#align(center)[
  #text(17pt)[*Конспект лекций по предмету*] \
  #text(20pt)[  *_Теория автоматического регулирования_*]
]\

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #figure(
      cetz.canvas({
        import cetz.draw: *

        scale(6)

        circle((0,0), name: "circle", radius: .2,stroke:none)
        content((name:"circle", anchor:   0deg), angle:-240deg, text(fill:rgb("#B8BB26"),size:6*14pt)[#sym.lambda])
        content((name:"circle", anchor:  60deg), angle:-180deg, text(fill:rgb("#83A598"),size:6*14pt)[#sym.lambda])
        content((name:"circle", anchor: 120deg), angle:-120deg, text(fill:rgb("#B8BB26"),size:6*14pt)[#sym.lambda])
        content((name:"circle", anchor: 180deg), angle: -60deg, text(fill:rgb("#83A598"),size:6*14pt)[#sym.lambda])
        content((name:"circle", anchor: 240deg), angle:   0deg, text(fill:rgb("#B8BB26"),size:6*14pt)[#sym.lambda])
        content((name:"circle", anchor: 300deg), angle:  60deg, text(fill:rgb("#83A598"),size:6*14pt)[#sym.lambda])
        content((0,-0.02), emph(text(fill:red,size:28pt)[#sym.integral.cont]))
      })
    ) <LOGO>
  ],
  [
    _Преподаватель_: \
    *Суханов Владимир Андреевич* \
    \
    _Автор конспекта_: \
    *Дмитриев Артем Константинович* \
    #link("mailto:artem020503@gmail.com")
  ]
)

// Custom outline
#let fakenumber = counter("mycounter")
#show outline.entry: it => {
  let loc = it.element.location()
  set text(hyphenate: false)
  set block(spacing: 1pt)
  fakenumber.step()
  grid(
    columns: (1fr,16fr,1fr),
    align: (right,left, bottom),
    context fakenumber.display() + ".  ",
    box([#link(loc)[#it.body] #box(width:1fr, repeat[.])]),
    [#box(width: 1fr, repeat[.]) #it.page]
  )
}

#show outline: it => {
  show heading: set align(center)
  show heading: set text(14pt)
  show heading: set block(above: 1.4em, below: 1em)
  it
}
#outline(
  title: "СОДЕРЖАНИЕ",
  indent: auto
)

#counter(heading).step()
#show heading: it => [
  #pagebreak(weak:true)
  #set text(14pt, hyphenate:false)
  #set block(above: 1.4em, below: 1em)
  #counter(heading).step()
  #grid(
    columns: (1fr,10fr),
    text(2em)[#counter(heading).display()],
    box(outset:.5em, radius:1em, it.body)
  )
  \
]

#show: fix-indent() // Отступ первой строки

= Аббревиатуры

#show "САР": name => box[
  #emph(text(blue)[#name])
] 

САР - система автоматического регулирования;


= Вводная лекиця 

*Информация*:
+ Пропускать нельзя. Больше одного пропуска приведёт к произволу начальства
+ Командная работа, коллективная ответсвенность
\

*Целью дисциплины явлентся*:
+ Получение знаний об основных принципах функционирования автоматического управления турбомашин
+ Навыки применения методов математического моделирования и рассчетных исследований этих систем с помощью современных методов (Mathlab simulink)
\

*Задачи*:
+ Классификация САР
+ Требования, предъявляемые к САР
+ Линейные математические модели САР
+ Типовые звенья автоматических систем
+ условия устойчивости автоматических систем
+ Способы корреции линейных автоматических систем
+ Законы автоматического регулирования
+ Математическое моделирование элементов САР турбоустановок
+ Основные сведение о нелинейных САР
\

Общие сведения о САР:\
Это совокупность автоматического #text(purple)[регулятора] и объекта регулирования.

В состав #text(purple)[регулятора] входит:
+ Регулирующий орган (исполнительный механизм)
+ Усилитель
+ Чувствительный элемент
+ Задающее устройство
\

Взаимосвязь всех элементов САР обеспечивается посредством каналов связи. Через эти каналы осуществляется обмен информацией между элементами САР. Для передачи информации могут использоваться электрический ток, воздух, жидкость (_Синтетическое масло_), компьютерные сети.

#pagebreak()

*Классификация САР:*

+ По способу задания регулируемой величины.\ Подразделяются на следующие системы:
  - Стабилизации;
    - $x_"opt"="const"$ на всех режимах работы. Пример: $50 "Гц"$
  - Программного регулирования;
    - $x_"опт"="var"$, характер изменения зарание известен.
  - Следящие:
    - $x_"опт"="var"$, характер изменения заранее не известен.

    #figure(
      cetz.canvas({
        import cetz.draw: *
        set-style(
          mark: (
            transform-shape: false,
            fill: black
          )
        )

        // scale(6)

        rect(name:"зу",(0,0),(1,1))
        circle(name:"lamp",(2.5,0.5),radius:0.5)

        rect(name:"у" ,(4,0),(5,1))
        rect(name:"ро",(6,0),(7,1))
        rect(name:"ор",(8,0),(9,1))
        rect(name:"чэ",(6,-2),(7,-3))

        content("зу","зу")
        content("у" ,"у" )
        content("ро","ро")
        content("ор","ор")
        content("чэ","чэ")

        line((1,.5),(2,.5))
        line((1,.5),(1.5,.5),mark:(end:"stealth") )
        line((3,.5),(4,.5))
        line((3,.5),(3.5,.5),mark:(end:"stealth") )
        line((5,.5),(6,.5))
        line((5,.5),(5.5,.5),mark:(end:"stealth") )
        line((7,.5),(8,.5))
        line((7,.5),(7.5,.5),mark:(end:"stealth") )

        line((2.5,0),(2.5,-2.5),(6,-2.5))
        line((9.5,0.5),(9.5,-2.5),(7,-2.5))
        line((5,-2.5),(4,-2.5),mark:(end:"stealth") )
        line((9,-2.5),(8,-2.5),mark:(end:"stealth") )

        // line((9,.5),(10,.5))
        line((9,.5),(11,.5),mark:(end:"stealth") )
        content((9.5,1),$x$)
        content("lamp.north-east",$epsilon_R$,anchor:"south-west")

        line(name:"f1",(8.2,2),(8.2,1),mark:(end:"stealth") )
        line(name:"f2",(8.8,2),(8.8,1),mark:(end:"stealth") )

        content("f1.start",$f_1$,anchor:"east")
        content("f2.start",$f_2$,anchor:"west")
      }),
      caption: [Функциональная схема САР],
    )

  $x$ - регулируемая величина (число оборотов)\
  $x_"опт"$ - оптимальное значение регулируемой величины\
  $epsilon_R$ - ошибка регулирования\
  "Лампочка" - сумматор\
  $f_x$ - возмущения

+ По принципу регулирования:
  + По возмущению
  + По отклонению (принцип обратной связи);
  + Комбинированный;
  + Адаптации.

  *РИСУНОК ПАРОВОЙ ТЭС*



