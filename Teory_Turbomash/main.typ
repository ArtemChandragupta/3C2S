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
#let leading = 1.5em - 0.75em // "Normalization"
#set block(spacing: leading)
#set par(spacing: leading)
#set par(leading: leading)

// Красивые
#import "@preview/colorful-boxes:1.4.2": *
// Диаграммы
#import "@preview/cetz:0.3.2"
// Отступы на первой строчке
#import "@preview/indenta:0.0.3": fix-indent
// Физические формулы
#import "@preview/physica:0.9.4": *

#align(center)[
  #text(17pt)[*Конспект лекций по предмету*] \
  #text(20pt)[*_Теория Турбомашин_*        ]
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
    )
  ],
  [
    _Преподаватель_: \
    *Семакина Елена Юрьевна* \
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

#show "САР": name => {
  emph(text(blue)[#name])
}
САР - система автоматического регулирования;


= КПД турбины

// Схема принципа действия ступени осевой турбины:


#outline-colorbox(
  title: [Адиабатический КПД],
  width: auto,
  radius: 2pt,
  centering: false
)[
  Оценивает гидравлическое совершенство турбины:

  $ eta_"ад"=(L_1-difference(L_"НА")-difference(L_"РК"))/L_t $
]

#outline-colorbox(
  title: [Окружной КПД - Важнейший],
  color: "red",
  width: auto,
  radius: 2pt,
  centering: false
)[
  Характеризует эффективность турбины по величине энергии переданной на лопатки РК. Он характеризует совершенство проточной части и учитывает потери с выходной скоростью:

  $ eta_"u"=L_u/L_t= (u_1 c_(1u)-u_2 c_(2u))/( (k R)/(k-1) T_0^* [1- (p_2/p_0^*)^((k-1)/k)] ) $

  Учитывает потери в НЛ и РЛ и с выходной скоростью:
  $ eta_u=H_u/H_0 approx (H_0-difference(H_1)-difference(H_2)-H_"вс")/(H_0) $

  Окружной КПД по параметрам торможения характеризует степень гидроодинамического совершенства турбинной ступени:
  $ eta_u^*=H_u/H_0^* approx (H_0-difference(H_1)-difference(H_2)-H_"вс")/(H_0-H_"вс") $

  Адиабатический КПД также характеризует степень гидродинамического совершенства турбин:
  $ eta_"ад"=H/H_0 approx (H_0-difference(H_1)-difference(H_2))/(H_0) $
]

#outline-colorbox(
  title: [Внутренний КПД (мощностной)],
  width: auto,
  radius: 2pt,
  centering: false
)[
  Характеризует эффективность турбины по величине энергии переданной на выходной вал турбины:

  $ eta_"ад"= L_e/L_t $
]

#pagebreak()
*Практика*:

Закон сохранения энергии для стационарного течения:
$ h+c^2/2 =h^*="const" $

$ h^*-h=c_p(T^*-T) "  " c_p= k/(k-1) R "  " T^*=T+c^2/(2 c_p) $

$ T^* = T (1+ (k-1)/2 c^2/(k R T) ) "  " c_(1 t)^2/2 = h_0^* - h_(1t) = c_p (T_0^* -T_(1t)) $

#outline-colorbox(
  title: [Изоэнтропийное течение],
  width: auto,
  radius: 2pt,
  centering: false
)[
  Закон сохранения энергии для изоэнтропийного течения:
  $ h+ c^2/2 = h^* ="const" $
  В изоэнтропийном процессе температура и давления связаны уравнением:
  $ p/p^* = (T/T^*)^ (1/(k-1)) $
]

Далее показывают газодинамические функции.

Задача 1:

Рассчитать параметры изоэнетропийного течения на выходе из сопла, найти площади минимального и выходного сечений.

#let T00 = 429
#let p00 = 0.3
#let p1 = 0.098
#let G = 0.3
#let k = 1.4
#let R = 287

$
  T_0^* &= #T00 &"К"\
  p_0^* &= #p00 &"МПа"\
  p_1   &= #p1 &"МПа"\
  G     &= #G &"кг/с"\
  k     &= #k &"-"\
  R     &= #R &"Дж"/("кг" dot "K")
$

Задача 2:

Расчитать число $M_c_1$, параметры изоэнтропийного течения на выходе из диффузора, найти параметры потока воздуха на входе в диффузор, а также $M_c_2$, входную и выходную скорость диффузора.

#let T1 = 300
#let p1 = 0.1
#let c1 = 150
#let c2 = 50
#let G = 20
#let etaD = 0.8
#let k = 1.4
#let R = 287

$
  T_1 &= #T1 & "К"\
  p1 &= #p1 & "МПа"\
  c_1   &= #c1 & "м/с"\
  c_2   &= #c2 & "м/с"\
  G     &= #G & "кг/с"\
  eta_д &= #etaD & "-"\
  k     &= #k & "-"\
  R     &= #R & "Дж"/("кг" dot "K")
$

Решение:

#let a1 = calc.sqrt(k * R * T1)
#let Mc1 = c1/a1
#let cp = k/(k - 1) * R
#let tau1 = 1/(1 + (k - 1)/2 * Mc1 * Mc1)
#let T11 = T1/tau1
#let pi1 = calc.pow(tau1, (k/(k - 1)))
#let p11 = p1 / pi1

$
  a_1 = sqrt(k R T_1) &= #a1 \
  M_c_1 = c_1/a_1 &= #Mc1 \
  c_p = k/(k-1) R &= #cp \
  tau_1 = 1/(1+ (k-1)/2 M^2) &= tau1\
  T_1^* = T_1 /tau_1 &= T11\
  pi_1 = tau_1^(k/(k-1)) &= pi1\
  p^*_1 = p_1/pi_1 &= #p11\
  H_t = c_1^2 
$


