User.create name: "Don", city: "Vancouver", picture: "https://lighthouselabs.ca/team/don_burks.JPG", description: "Puns, puns everywhere and not a drop to drink.", badge_count: 3

User.create name: "Murat", city: "Vancouver", picture: "https://lighthouselabs.ca/team/murat.jpg", description: "No wait, that's python!", badge_count: 4

User.create name: "Monica", city: "Vancouver", picture: "https://lighthouselabs.ca/team/monica.jpg", description: "Ducks are awesome.", badge_count: 5

User.create name: "David", city: "Vancouver", picture: "https://lighthouselabs.ca/team/davidvandusen.jpg", description: "Long explanation: You don't need to know that.", badge_count: 6

Group.create name: "Gold Diggers"

Group.create name: "LHL"

Group.create name: "Launch Academy"

Activity.create name: "Skiing", date: "2015/11/20", time: "9:00", location: "Whistler Mountain, Whistler", completed: false, group_id: 1

Activity.create name: "Hiking", date: "2015/11/25", time: "14:00", location: "Stawamus Chief, Squamish", completed: false, group_id: 1

Activity.create name: "Frisbee", date: "2015/11/24", time: "17:00", location: "Stanley Park, Vancouver", completed: false, group_id: 1

Usergroup.create user_id: 1, group_id: 1

Usergroup.create user_id: 2, group_id: 1

Usergroup.create user_id: 3, group_id: 2

Usergroup.create user_id: 4, group_id: 2

Usergroup.create user_id: 1, group_id: 3

Usergroup.create user_id: 3, group_id: 3
