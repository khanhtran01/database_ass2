function getLink(id){
    const currUrl = window.location.href;
    const number = currUrl.split('/');
    var pageNumber = number[number.length - 2];
    // alert(1);

    if (isNaN(pageNumber)){
        pageNumber = number[number.length - 1]
        if (isNaN(pageNumber)){
            pageNumber = 1;
        }
        if (pageNumber == ""){
            pageNumber = 1;
        }
    }
    if (pageNumber == 10){
        id = id.replaceAll('/','-');
    }
    // alert(id);
    var link = "Edit/remove/" + id + "/" + pageNumber;
    
    location.href = link;
  }