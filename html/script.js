let allItems = [];
let selectedItem = null;

window.addEventListener('message', (event) => {
  const data = event.data;
  const app = document.getElementById('app');
  if (!app) return;

  if (data.action === 'open') {
    app.style.display = 'flex';
    allItems = Object.values(data.items || []);
    renderItems(allItems);
  } else if (data.action === 'close') {
    app.style.display = 'none';
  }
});

document.getElementById('search').addEventListener('input', (e) => {
  const term = e.target.value.toLowerCase();
  const filtered = allItems.filter(i => (i.label || i.name || '').toLowerCase().includes(term));
  renderItems(filtered);
});

document.getElementById('closeBtn').addEventListener('click', () => {
  fetch(`https://${GetParentResourceName()}/close`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({})
  });
});

function renderItems(items) {
  const grid = document.getElementById('grid');
  grid.innerHTML = '';
  if (!items || items.length === 0) {
    grid.innerHTML = '<div style="color:#ccc;padding:12px">No items found.</div>';
    return;
  }

  items.forEach(item => {
    const div = document.createElement('div');
    div.className = 'item';
    div.innerHTML = `
      <img src="nui://ox_inventory/web/images/${item.name}.png" alt="${item.label || item.name}">
      <div class="item-name">${item.label || item.name}</div>
    `;
    div.onclick = () => openItemPopup(item);
    grid.appendChild(div);
  });
}

function openItemPopup(item) {
  selectedItem = item;
  document.getElementById('popupItemName').textContent = item.label || item.name;
  document.getElementById('popupItemImg').src = `nui://ox_inventory/web/images/${item.name}.png`;
  document.getElementById('popupAmount').value = 1;
  document.getElementById('popupTarget').value = 0;
  document.getElementById('itemPopup').style.display = 'flex';
}

// Confirm button
document.getElementById('popupConfirm').addEventListener('click', () => {
  const amount = parseInt(document.getElementById('popupAmount').value) || 1;
  const target = parseInt(document.getElementById('popupTarget').value) || 0;

  if (!selectedItem) return;

  fetch(`https://${GetParentResourceName()}/giveItem`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ item: selectedItem.name, amount, target })
  });

  closePopup();
});

// Cancel button
document.getElementById('popupCancel').addEventListener('click', closePopup);

function closePopup() {
  document.getElementById('itemPopup').style.display = 'none';
  selectedItem = null;
}






