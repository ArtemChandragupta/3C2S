#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Динамика и прочность энергетических машин",
  teacher: "Суханов Александр Игоревич",
)

= Вводная лекция

#line(length:100%)

#teo(name: "Учебные пособия")[
  - _Ласкин, Зуев, Стрижак_: Прочность энергетических машин.
  - _Иноземцев_: Проектирование газовых турбин.
  - _Костюк_: Динамика и прочность турбомашин.
]

Темы занятий по семестрам:
+ Статическая прочность
+ Динамическая прочность
+ Эксплуатационная прочность (особые условия - за пределами упругости)

#line(length: 100%)\

Рассмотрим напряжение на малой площадке:\
Строим призму, чтобы разделить напряжение на составляющие.

Вводим $tau_(z z), tau_(z y), tau_(z x) $ на задней площадке $z$ и аналогично на других площадках.

Нормальные напряжения:
$ tau_(z z)=sigma_z, "  " tau_(y y)=sigma_y, "  " tau_(x x)=sigma_x $

#teo(name: "Тензор наряжений")[$
  T_sigma = mat(
    sigma_x,   tau_(x y), tau_(x z);
    tau_(y x), sigma_y,   tau_(y z);
    tau_(z x), tau_(z y), sigma_z;
  )
$]

#grid(
  columns:(1fr,1fr),
  figure(
    cetz.canvas(length:1cm, {
      import cetz.draw: *
      set-style(
        mark: (transform-shape: false, fill: black)
      )

      line(name:"axisx", (0,0),(5,0), mark:(end: "stealth"))
      line(name:"axisy", (0,-2),(0,5), mark:(end: "stealth"))
      content("axisx.end", $epsilon$, padding:.2, anchor:"north-west" )
      content("axisy.end", $sigma$,   padding:.1, anchor:"south-west" )

      catmull((0,0),(1,2),(1.5,3),(2,3),(3,3),(5,4),(6,3))
      catmull((0,-1),(.5,0),(1.5,2),(2,3),(3,3),(5,4),(6,3),stroke:(dash:"dashed"))
      content((0,-1),[#sym.arrow.l.long остаточное напряжение], anchor:"west", padding:.5em)

    })
  ),
  [
    Закон Гука:
    $ sigma = E dot epsilon; "   " epsilon = difference(l)/l $

    Нам нужны материалы с $epsilon>= 0.1$, иначе привередливо считаем материал хрупким.
  ]
)
