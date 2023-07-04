function createSearchBox() {
  const searchBox = document.createElement('input');
  searchBox.type = 'text';
  searchBox.id = 'searchBox';
  searchBox.placeholder = 'Search...';
  searchBox.style.width = '100%';
  searchBox.style.padding = '12px 20px';
  searchBox.style.margin = '8px 0';
  searchBox.style.boxSizing = 'border-box';
  searchBox.style.fontSize = '16px';
  searchBox.addEventListener('keyup', searchFilter);
  return searchBox;
}

function searchFilter() {
  const input = document.getElementById('searchBox');
  const filter = input.value.toUpperCase();
  const content = document.querySelector('.layout__cardColumnFull');
  const items = content.getElementsByClassName('Applications__app');

  for (let i = 0; i < items.length; i++) {
    const appName = items[i].getElementsByClassName('Applications__appName')[0];
    const txtValue = appName.textContent || appName.innerText;

    if (txtValue.toUpperCase().indexOf(filter) > -1) {
      items[i].style.display = '';
    } else {
      items[i].style.display = 'none';
    }
  }
}

function insertSearchBox() {
  const content = document.querySelector('.layout__cardColumnFull');
  if (content) {
    const searchBox = createSearchBox();
    content.parentNode.insertBefore(searchBox, content);
  }
}

insertSearchBox();