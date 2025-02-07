#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Теория Автоматического регулирования",
  teacher: "Суханов Владимир Андреевич",
)

#heading(numbering:none)[Термины]

#show "САР": name => text(blue)[_#name _]
САР - система автоматического регулирования;

= Вводная лекция
\

*Информация*:
+ Пропускать нельзя. Больше одного пропуска приведёт к произволу начальства
+ Командная работа, коллективная ответсвенность
\

*Целью дисциплины явлется*:
+ Получение знаний об основных принципах функционирования автоматического управления турбомашин
+ Навыки применения методов математического моделирования и рассчетных исследований этих систем с помощью современных методов (Matlab simulink)
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

#teo(name: [Общие сведения о САР])[
  Это совокупность автоматического _регулятора_ и объекта регулирования.
]

В состав _регулятора_ входит:
+ Регулирующий орган (исполнительный механизм)
+ Усилитель
+ Чувствительный элемент
+ Задающее устройство
\

Взаимосвязь всех элементов САР обеспечивается посредством каналов связи. Через эти каналы осуществляется обмен информацией между элементами САР. Для передачи информации могут использоваться электрический ток, воздух, жидкость (_Синтетическое масло_), компьютерные сети.

#pagebreak()\

*Классификация САР:*

+ По способу задания регулируемой величины подразделяются на системы:
  - Стабилизации;
    - $x_"opt"="const"$ на всех режимах работы. Пример: $50 "Гц"$
  - Программного регулирования;
    - $x_"опт"="var"$, характер изменения зарание известен.
  - Следящие:
    - $x_"опт"="var"$, характер изменения заранее не известен.

// #diagram(
//   node((0,1), $A$, stroke: 1pt, shape: fletcher.shapes.diamond),
//   node((2,0), [Bézier], fill: purple.lighten(80%)),
//   render: (grid, nodes, edges, options) => {
//     cetz.canvas({
//       fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
//       cetz.draw.line((0,0),(2,2))
//     })
//   }
// )

#figure(
  [
    #cetz.canvas({
      import cetz.draw: *
      set-style(
        mark: (
          transform-shape: false,
          fill: black
        )
      )

      rect(name:"зу",(0,0),(1,1))
      circle(name:"lamp",(2.5,0.5),radius:0.5)
      arc((2.5,.5),radius:0.5,mode:"PIE",   start:225deg, delta:90deg, fill:black, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")

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

      line((9,.5),(11,.5), mark:(end:"stealth") )
      content((9.5,1),$x$)
      content("lamp.north-east", $epsilon_R$, anchor:"south-west")
      content("зу.north-east",   $x_"опт"$,   anchor:"south-west")

      line(name:"f1", (8.2,2),(8.2,1), mark:(end:"stealth") )
      line(name:"f2", (8.8,2),(8.8,1), mark:(end:"stealth") )

      content("f1.mid", $f_1$, anchor:"south-east", padding:.1)
      content("f2.mid", $f_2$, anchor:"south-west", padding:.1)
    })
    $x$ - регулируемая величина (число оборотов)\
  $x_"опт"$ - оптимальное значение регулируемой величины\
  $epsilon_R$ - ошибка регулирования\
  "Лампочка" - сумматор\
  $f_x$ - возмущения
  ],
  caption: [Функциональная схема САР],
)


// #figure(
//   [#diagram(
//     node-stroke: 1pt,
//
//     node((0,0),"зу",shape:rect),
//     edge("-|>-"),
//     node((1,0),radius:1,name:"lamp"),
//     edge("-|>-"),
//     node((2,0),"у",shape:rect),
//     edge("-|>-"),
//     node((3,0),"ро",shape:rect),
//     edge("-|>-"),
//     node((4,0),"ор",shape:rect,name:<or>),
//     edge("-|>",$x$),
//     node((5,0),),
//     node((4.5,0),name:"x"),
//
//     edge((<or.north-west>, 25%, <or.north-east>),"<|-", "u", $f_1$,label-side: left),
//     edge((<or.north-west>, 75%, <or.north-east>),"<|-", "u", $f_2$),
//
//     edge(<lamp>,<che>,corner:left,"<|-"),
//     node((3,1),"чэ",shape:rect,name:"che"),
//     edge(<che>,<x>,corner:left,"<|-"),
//     render: (grid, nodes, edges, options) => {
//       cetz.canvas({
//         fletcher.draw-diagram(grid, nodes, edges, debug: options.debug)
//         cetz.draw.arc((2.5,.5),radius:0.5,mode:"PIE",   start:225deg, delta:90deg, fill:black, anchor:"origin")
//         cetz.draw.arc((2.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
//         cetz.draw.arc((2.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")
//       })
//     }
//     )
//
//     #align(left)[Где:]
//     $ x &"- регулируемая величина (число оборотов)"\
//     x_"опт" &"- оптимальное значение регулируемой величины"\
//     epsilon_R &"- ошибка регулирования"\
//     "Лампочка" &"- сумматор"\
//     f_x &"- возмущения" $
//   ],
//   caption: [Функциональная схема САР],
// )

2. По принципу регулирования:
  + По возмущению
  + По отклонению (принцип обратной связи);
  + Комбинированный;
  + Адаптации.

  *РИСУНОК ПАРОВОЙ ТЭС*
