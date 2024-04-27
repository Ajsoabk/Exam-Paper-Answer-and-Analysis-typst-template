#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)
/**
选择题与判断题的输出，包括题面，选项*，代码*
*/
#let limited_selection_problem(body,opts:())={
  let show_opts(t) = text(size:12pt)[#t]

  [#body\ ]
  let opt_cnt = counter("option_counter")
  opt_cnt.update(0)
  for opt in opts{
    opt_cnt.step();
    show_opts([☐ #opt_cnt.display("A"). #opt\ ])
  }
  [\ ]
}
#let selection(body,opts)={
  let cnt = counter("selection_problem_counter")
  cnt.step();
  [#limited_selection_problem(text(size:17pt)[#cnt.display().#body],opts:opts)]
}
#let judgement(body)={
  let cnt = counter("judgement_problem_counter")
  cnt.step();
  [#limited_selection_problem([#cnt.display().#body ( )])]
}


#judgement("judge")
#selection("C++",("good","bad"))
#selection("C++",("worse","better"))
