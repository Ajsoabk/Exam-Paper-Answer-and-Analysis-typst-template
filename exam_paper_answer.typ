#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)

#let select_cnt = counter("selection_problem_counter")
#let display_select(body,opts)={
  let show_head(t) = text(size:20pt)[#t]
  let show_opts(t) = text(size:12pt)[#t]

  select_cnt.step();
  show_head([#select_cnt.display().#body\ ])
  let opt_cnt = counter("option_counter")
  for opt in opts{
    opt_cnt.step();
    show_opts([#opt_cnt.display(). #opt\ ])
  }
  [\ ]
}
#display_select("C++",("good","bad"))
#display_select("C++",("worse","better"))