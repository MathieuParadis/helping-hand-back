# This repository is the back of the Helping Hand app: [Helping Hand](https://helpping-hand.herokuapp.com/)

## Description :
Helping Hand is a local charity whose mission is to help to build a strong community by promoting the good. We aim to educate, and inspire people to embrace kindness and charitable giving, and in doing so, be the change they want to see in the world. To achieved this goal, we have developed a plateform to help connecting people in need with volunteers within the community. We believe that by making it easier for people to give and reach out to help those less fortunate than themselves, they will feel empowered and are more likely to volunteer.


## Developpers:
- [Mathieu](https://github.com/MathieuParadis)


## Helping Hand Frontend:
* [Git repository](https://github.com/MathieuParadis/helping-hand)
* [Production link](https://helpping-hand.herokuapp.com/)


## How to use it:
### Important notice:
All endpoints are protected by authentication. You must create an account [here](https://helpping-hand.herokuapp.com/signup/) to access to the ressources on this app.

### In development:
Clone the repository on your machine, and run:
```
bundle install
rails db:create
rails db:migrate
rails db:seed
rails server
```
Then, access the app in your browser at http://localhost:3000/

### In production:
End points of the app in production
* [Users](https://helpping-hand-back.herokuapp.com/users)
* [Requests](https://helpping-hand-back.herokuapp.com/requests)
* [chats](https://helpping-hand-back.herokuapp.com/chats)
