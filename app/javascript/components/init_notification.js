const initNotification = () =>{
  const notification = document.querySelector('#notification');
  const phone = document.querySelector('.iphone');
  const notiContainer = document.querySelector('.noti_click');
  const imageUrl = document.querySelector('#image_url').innerText;
  const notiIcon = document.querySelector('.noti_click_icon')


  phone.addEventListener('click', () => {
    console.log('clicked');
   notiContainer.innerHTML = "<div class='notification' id='notification'><img src=" + imageUrl + " alt='notification' class='notification-icon'><h6 class='notification-title'>MESSAGES</h6><strong><p class='notification-kanga'>Kanga</p></strong><p class='notification-text'> Your order is ready in 2min!</p><p class='notification-time'>now</p></div>"
  });

};

export { initNotification };
