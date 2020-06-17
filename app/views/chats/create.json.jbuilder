json.user_nickname @chat.user.nickname
json.created_at @chat.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @chat.content
json.image @chat.image.url
josn.id @chat.id