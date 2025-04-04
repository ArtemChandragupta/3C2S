#import "./template.typ": *

#show: conf.with(
  title:   "Конспект лекций по предмету",
  subject: "Теплотехнические измерения и приборы",
  teacher: "Эльза Рафисовна",
)

= Вводная лекция

#imp(name:"Заповедь БОГА")[
  Вводная лекция должна быть вводной.\
  Первая пара кончается раньше.
  
  Зачёт с оценкой!

  РМГ 29-2013 ГСИ. Метрология: Основные термины и определения.
]

#teo(name:"Метрология")[
  Это наука об измерениях, о методах и средствах обеспечения их единства, а также оценке точности измерений.
]

Величины делятся на реальные и идеальные. С реальными мы работаем, идеальные - математические модели.

Реальные величины делятся на физические и нефизические (например, результаты работы социолога). Физические делятся на измеряемые (имеют единицы измерения) и оцениваемые.

#teo(name:"Основное уравнение метрологии")[
  $ A = k dot A_0 $
  \

  Где:\
  $
    A &- "Искомое значение физической величины"\
    k &- "Коэффициент пропорциональности"\
    A_0 &- "Значение величины, принятой за образец"
  $
]

#teo(name:"Основное уравнение измерения")[
  $ A = a [A] $
  \

  Где:\
  $
    A &- "Искомое значение физической величины"\
    k &- "Числовое значение. Количественная характеристика"\
    [A] &- "Размерность. Качественная характеристика величины"
  $
]

= Измерение скорости потока

Методы измерения скорости газов и жидкостей:
+ Кинематические измерения:
  - Определённый маленький объём каким-нибудь образом отмечается в потоке жидкости и его движение регистрируется приборами.
+ Динамические измерения:
  - Использует взаимодействие между потоком и измерительным зондом или между потоком и электрическим, магнитным и термодинамическим полями.
+ Физические измерения:
  - ...

#imp(name: "Анемометрия")[
  Измерение скорости текучих сред.\
  Различают:
  + Оптические
    - Измеряют лазером координаты частиц 
    $ R(n,m)=sum_i^N sum_j^M I(k,i,j) dot I(k+1,i+1,j+1) $
  + Механические
    - Чашечные
    - Крыльчатые
  + Тепловые
    - С горячей проволокой. Проволока нагревается до $600-800 C$ и охлаждается потоком.
      + $T = "const - популярный"$
      + $R = "const"$
      + $I = "const"$
  + Ультразвуковые
  + Манометрические
    - Трубка Пито-Прандтля - полного напора
]

= Термометрия

Классификация термометров:
- Расширения
- Термоэлектрические
- Сопротивления:
  - Термометры сопротивления и термистры
- Пирометры:
  - Оптические, радиационные, цветовые и фотоэлектрические

== Термоэлектрический эффект

Обнаружил Гальвани. Его пинцет был обломан - он был из меди и цинка. Он думал, что нашёл животное электричество.

Зеебек проводил опыты с Вольтом. Он думал, что нашёл электромагнетизм.

#teo(name:"Эффект Зеебека")[
  В контакт приводятся горячий и холодный спаи. Тело в том, что в разных проводниках разное количество свободных зарядов, происходит диффузионный ток. Возникает _диффузионный ток_. Он уравновешивается _контактной разницей потенциалов_, направленной в другую сторону.

  Ещё есть фононное увлечение, но оно влияет только при очень низких температурах.
]

Термопара всегда измеряет именно *разность* температур.

Горячий спай - измерительный конец, холодный спай - мультиметр.

Если $t_"гс" = t_0 ->$

$ e_"AB"(t_0) + e_"BC"(t_0) + e_"CA"(t_0)=0 $

$ e_"AB"(t_0) = - e_"BA"(t_0) $

Если $t_"гс" != t_0 ->$

$ e_"AB"(t) + e_"BC"(t_0) + e_"CA"(t_0)= E(t,t_0) $

$ e_"AB"(t) + e_"BA"(t_0) = E(t,t_0) $

$ e_"AB"(t) - e_"AB"(t_0) = E(t,t_0) $

$ E(t,t_0) = ... $
