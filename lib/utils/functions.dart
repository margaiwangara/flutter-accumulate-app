String formatDate(String dateInput) {
  var today = new DateTime.now();
  var parsedDate = DateTime.parse(dateInput);

  // get difference between dates
  var dateDifference = parsedDate.difference(today);

  // check difference
  // in seconds
  if (dateDifference.inSeconds > 0 &&
      dateDifference.inSeconds < 60) if (dateDifference.inSeconds == 1)
    return "${dateDifference.inSeconds} second ago";
  else
    return "${dateDifference.inSeconds} seconds ago";
  else if (dateDifference.inMinutes > 0 &&
      dateDifference.inMinutes < 60) if (dateDifference.inMinutes == 1)
    return "${dateDifference.inMinutes} minute ago";
  else
    return "${dateDifference.inMinutes} minutes ago";
  else if (dateDifference.inHours > 0 &&
      dateDifference.inHours < 24) if (dateDifference.inHours == 1)
    return "${dateDifference.inHours} hour ago";
  else
    return "${dateDifference.inHours} hours ago";
  else if (dateDifference.inDays > 0 &&
      dateDifference.inDays < 7) if (dateDifference.inDays == 1)
    return "${dateDifference.inDays} day ago";
  else
    return "${dateDifference.inDays} days ago";
  else
    return "${parsedDate.toString().split(' ')[0].replaceAll(new RegExp(r'-'), '/')}";
}
