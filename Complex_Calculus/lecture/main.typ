#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Комплексные расчёты",
  teacher: "Семакина Елена Юрьевна",
)

= Пространственная структура потока в турбомашинах

#teo(name:"Метод цилиндрических сечений")[
  Способ применения одномерной и двумерной теории к исследованию пространственной структуры потока.\
  Границы применимости - небольшие радиальные скорости.
]

МЦС не может дать точного решения в случаях:
- большого относительного шага решетки;
- длинных лопаток ($D_"ср"/l<7$);
- больших углов раскрытия меридиональных обводов.
\

Предполагаем, что поток *осесимметричный* и *стационарный*.\
Решение задач МЦС сводится к расчету распределения параметров потока по высоте канала в межвенцовых зазорах ступеней турбины.

#teo(name:"Уравнение радиального равновесия")[
  Изменение параметров в межвенцовом зазоре вдоль радиуса связаны между собой уравнением Эйлера.

  Массовые силы равны нулю:
  $ E=c^2/2 + P="const" $

  Поток изоэнтропийный:
  $ i^*="const"; => grad E = grad i^* = 0 $

  Уравнение Эйлера в форме Громека-Лэмба:

  $ pdv(arrow(c),t) +arrow(c) x "rot" arrow(c)= grad E => pdv(arrow(c),t)+ arrow(c) + "rot" arrow(c)=0 $

  Для стационарного потока:
  $ pdv(arrow(c),t)=0=> arrow(c) x "rot" arrow(c) = 0 $

  $ cases(
    grad_r P = 1/rho grad\
    grad_r c^2/2 = pdv(c,r)
  ) $
]
