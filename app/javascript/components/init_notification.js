const initNotification = () =>{
  const notification = document.querySelector('#notification');
  const phone = document.querySelector('.iphone');
  const popup = document.querySelector('#notification_symbol');
  const notiContainer = document.querySelector('.noti_click');
  const imageUrl = document.querySelector('#image_url').innerText;
  const notiIcon = document.querySelector('.noti_click_icon')


  phone.addEventListener('click', () => {
    console.log('clicked');
   notiContainer.innerHTML = "<div class='notification' id='notification'><img src=" + imageUrl + " alt='notification' class='notification-icon'><h6 class='notification-title'>KANGA</h6><p class='notification-text'> Your order is ready!</p><p class='notification-time'>1 min ago</p></div>"
   notiIcon.innerHTML = "<div class='notification-symbol' id='notification_symbol'>1</div>"
  });

};

export { initNotification };
