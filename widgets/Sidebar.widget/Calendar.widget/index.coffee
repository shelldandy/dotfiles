# Code originally created by Adam Vaughan (https://github.com/adamvaughan)
# Haphazardly adjusted and mangled by Pe8er (https://github.com/Pe8er)

Sunday = 'cal && date "+%-m %-d %y"'

Monday =  'cal | awk \'{ print " "$0; getline; print "Mo Tu We Th Fr Sa Su"; \
getline; if (substr($0,1,2) == " 1") print "                    1 "; \
do { prevline=$0; if (getline == 0) exit; print " " \
substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }\' && date "+%-m %-d %y"'

options =
  # Easily enable or disable the widget.
  widgetEnable: true

  # Set this to true to enable previous and next month dates, or false to disable.
  otherMonths : true

  # Specify the first day of the week (Monday or Sunday)
  firstDay    : Monday

  # Choose color theme.
  widgetTheme: "dark"                   # dark | light

refreshFrequency: '1h'

command: options.firstDay

style: """

  // Let's do theming first.

  if #{options.widgetTheme} == dark
    fColor = white
    bgColor = black
  else
    fColor = black
    bgColor = white

  // Specify color palette.

  fColor1 = rgba(fColor,1.0)
  fColor08 = rgba(fColor,0.8)
  fColor05 = rgba(fColor,0.5)
  fColor02 = rgba(fColor,0.2)
  bgColor1 = rgba(bgColor,1.0)
  bgColor08 = rgba(bgColor,0.7)
  bgColor05 = rgba(bgColor,0.5)
  bgColor02 = rgba(bgColor,0.2)

  width 176px
  height auto
  overflow hidden
  background-color bgColor02

  .wrapper
    height 100%
    color fColor1
    padding 8px
    align-items center
    display flex

  .wrapper table
    border-collapse: collapse
    table-layout: fixed
    margin 0 auto

  td
    text-align center
    padding 4px

  thead tr
    &:first-child td
      font-size 12pt
      font-weight 200
      color fColor1

    &:last-child td
      font-size 7.5pt
      padding-bottom 8px
      font-weight 500
      color fColor05

  tbody td
    font-size 7.5pt

  .today
    font-weight bold
    background fColor02
    width 24px
    height 24px
    margin 0
    padding 0

  .grey
    color: fColor05
"""

options : options

render: -> """
  <div class='wrapper'>
    <table>
      <thead>
      </thead>
      <tbody>
      </tbody>
    </table>
  </div>
"""

updateHeader: (rows, table) ->
  thead = table.find("thead")
  thead.empty()

  thead.append "<tr><td colspan='7'>#{rows[0]}</td></tr>"
  tableRow = $("<tr></tr>").appendTo(thead)
  daysOfWeek = rows[1].split(/\s+/)

  for dayOfWeek in daysOfWeek
    tableRow.append "<td>#{dayOfWeek}</td>"

updateBody: (rows, table) ->

  #Set to 1 to enable previous and next month dates, 0 to disable
  PrevAndNext = 1

  tbody = table.find("tbody")
  tbody.empty()

  rows.splice 0, 2
  rows.pop()

  today = rows.pop().split(/\s+/)
  month = today[0]
  date = today[1]
  year = today[2]

  lengths = [31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
  if year%4 == 0
    lengths[2] = 29

  for week, i in rows
    days = week.split(/\s+/).filter (day) -> day.length > 0
    tableRow = $("<tr></tr>").appendTo(tbody)

    if i == 0 and days.length < 7
      for j in [days.length...7]
        if @options.otherMonths == true
          k = 6 - j
          cell = $("<td>#{lengths[month-1]-k}</td>").appendTo(tableRow)
          cell.addClass("grey")
        else
          cell = $("<td></td>").appendTo(tableRow)

    for day in days
      cell = $("<td>#{day}</td>").appendTo(tableRow)
      cell.addClass("today") if day == date

    if i != 0 and 0 < days.length < 7 and @options.otherMonths == true
      for j in [1..7-days.length]
        cell = $("<td>#{j}</td>").appendTo(tableRow)
        cell.addClass("grey")

update: (output, domEl) ->

  div = $(domEl)

  if @options.widgetEnable
    rows = output.split("\n")
    table = div.find("table")

    @updateHeader rows, table
    @updateBody rows, table

    # Sort out flex-box positioning.
    div.parent('div').css('order', '5')
    div.parent('div').css('flex', '0 1 auto')
  else
    div.remove()
