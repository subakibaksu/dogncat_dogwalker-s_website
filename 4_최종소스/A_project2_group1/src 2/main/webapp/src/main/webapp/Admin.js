// 산책예약 체크박스
$(document).ready(function () {
  $("#check-allWalking").click(function () {
    if ($("#check-allWalking").is(":checked"))
      $("input[name=rwc]").prop("checked", true);
    else $("input[name=rwc]").prop("checked", false);
  });

  $("input[name=rwc]").click(function () {
    var total = $("input[name=rwc]").length;
    var checked = $("input[name=rwc]:checked").length;

    if (total != checked) $("#check-allWalking").prop("checked", false);
    else $("#check-allWalking").prop("checked", true);
  });
});

// 돌봄예약 체크박스
$(document).ready(function () {
  $("#check-allCare").click(function () {
    if ($("#check-allCare").is(":checked"))
      $("input[name=rcc]").prop("checked", true);
    else $("input[name=rcc]").prop("checked", false);
  });

  $("input[name=rcc]").click(function () {
    var total = $("input[name=rcc]").length;
    var checked = $("input[name=rcc]:checked").length;

    if (total != checked) $("#check-allCare").prop("checked", false);
    else $("#check-allCare").prop("checked", true);
  });
});

// 회원 체크박스
$(document).ready(function () {
  $("#check-allMember").click(function () {
    if ($("#check-allMember").is(":checked"))
      $("input[name=mc]").prop("checked", true);
    else $("input[name=mc]").prop("checked", false);
  });

  $("input[name=mc]").click(function () {
    var total = $("input[name=mc]").length;
    var checked = $("input[name=mc]:checked").length;

    if (total != checked) $("#check-allMember").prop("checked", false);
    else $("#check-allMember").prop("checked", true);
  });
});

// 예약관리에서 다른 탭 이동시 예약상태 체크박스 해제 기능
$(document).ready(function () {
  $(".nav-item").click(function () {
    if ($(".bigCheck").is(":checked"))
      $("input[name=rwc]").prop("checked", false);

    if ($(".bigCheck").is(":checked")) $(".bigCheck").prop("checked", false);
  });
});

// 돌봄예약에서 다른 탭 이동시 라디오 버튼 해제 기능
$(document).ready(function () {
  $(".nav-item").click(function () {
    if ($(".bigRadio").is(":checked"))
      $("input[name=rcr]").prop("checked", false);

    if ($(".bigRadio").is(":checked")) $(".bigCheck").prop("checked", false);
  });
});
