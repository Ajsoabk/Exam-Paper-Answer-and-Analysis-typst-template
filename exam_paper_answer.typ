#set page(
  paper: "a6",
  margin: (x: 1.8cm, y: 1.5cm),
)
#let anss=();
#let answer_table(anss)={
    table(columns: anss.len(),..range(1,anss.len()+1).map(str),..anss)
}
/**
选择题与判断题的输出，包括题面，选项*，代码*
*/
#let limited_selection_problem(statement,opts,code,statement_size,answer,analysis)={
  text(size:statement_size)[#statement]//题面
  if code!=none{
    raw(code,block: true,lang: "c++")
  }
  else{parbreak()}
  let opt_cnt = counter("option_counter")
  opt_cnt.update(0)
  for opt in opts{
    opt_cnt.step();
    text(size:12pt)[☐ #opt_cnt.display("A"). #opt\ ]
  }
  parbreak()
  text([【答案】#answer\ 【解析】#analysis\ ],fill: red)
}
#let selection(body,opts,answer,analysis,code:none)={
  let cnt = counter("selection_problem_counter")
  cnt.step();
  limited_selection_problem(
    [#cnt.display().#body],
    opts,
    code,
    15pt,
    answer.last(),
    analysis)
}
#let judgement(body,answer,analysis)={
  let cnt = counter("judgement_problem_counter")
  cnt.step();
  limited_selection_problem(
    [#cnt.display().#body ( )],
    (),
    none,
    12pt,
    if answer.last()==true{"√"}else{"x"},
    analysis)
}

#anss.push("A");
#selection("C++",("good","bad"),anss,"易证",code:"int a")
#anss.push("B");
#selection("C++",("worse","better"),anss,"trival")
