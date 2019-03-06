const bootstrapHTML = "<div class='row'><div class='col-lg-12'><div class='button-group'>"

const startDropdownHTML = "<button type='button' class='btn btn-default btn-sm dropdown-toggle' data-toggle='dropdown'>"
const endDropdownHTML = "</button><ul class='dropdown-menu'><button class='split-tab-confirm-drinks'>Add</button></ul></div></div></div><div class='row'><div class='selected-drinks'></div></div</div>"

const confirmFriendsBtn = document.getElementById('split-tab-confirm-friends');
const friendList = document.getElementById('split-tab-friends-list');
const drinkElements = document.querySelectorAll('.order-drink');

const selectedFriends = {};
const selectedDrinks = {};
const availableDrinks = {};

const insertAvailableDrinks = (list) => {
  for (const drink in availableDrinks) {
    // Some logic to determine which drinks to display
    list.insertAdjacentHTML("afterbegin",
      "<li><a href='#'' class='small' data-value='" + drink + "' tabIndex='-1'><input type='checkbox'/>&nbsp;" + drink + "</a></li>")
  }

}

const initSplitBill = () => {

  if (drinkElements) {
    drinkElements.forEach((drink) => {
      availableDrinks[drink.getAttribute('data-drink')] = drink.getAttribute('data-amount');
    })
  }

  $( '.dropdown-menu a' ).on( 'click', function( event ) {

     var $target = $( event.currentTarget ),
         val = $target.attr( 'data-value' ),
         $inp = $target.find( 'input' ),
         idx;

     if ( selectedFriends.hasOwnProperty( val ) ) {
        delete selectedFriends[val];
        setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
     } else {
        selectedFriends[val] = $target.text().trim();
        setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
     }

     console.log(selectedFriends);

     $( event.target ).blur();

     return false;
  });

  confirmFriendsBtn.addEventListener("click", () => {
    for (const friend in selectedFriends) {
      friendList.insertAdjacentHTML("beforeend",
        bootstrapHTML + "<div class='available-drinks-list'>" + selectedFriends[friend] + startDropdownHTML + "Drinks" + endDropdownHTML
      )
    }

    const availableDrinksLists = document.querySelectorAll('.available-drinks-list ul');
    availableDrinksLists.forEach((list) => {
      insertAvailableDrinks(list);
    })

    const drinkOptions = friendList.querySelectorAll('.dropdown-menu a');
    drinkOptions.forEach((drinkOption) => {
      drinkOption.addEventListener("click", (event) => {
        var $target = $( event.currentTarget ),
            val = $target.attr( 'data-value' ),
            $inp = $target.find( 'input' ),
            idx;

        if ( selectedDrinks.hasOwnProperty( val ) ) {
           delete selectedDrinks[val];
           setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
        } else {
           selectedDrinks[val] = $target.text().trim();
           setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
        }

        console.log(selectedDrinks);

        $( event.target ).blur();

        return false;
      })
    })
  })

}

export { initSplitBill }

// <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown"></span>Users</button>
// <ul class="dropdown-menu">
//   <% @friends.each do |friend| %>
//     <li><a href="#" class="small" data-value="<%= friend.id %>" tabIndex="-1"><input type="checkbox"/>&nbsp;<%= friend.email %></a></li>
//   <% end %>
//   <button id="split-tab-confirm-friends">Add</button>
// </ul>
