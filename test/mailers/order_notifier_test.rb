class OrderNotifierTest < ActionMailer::TestCase
test "received" do
mail = OrderNotifier.received(orders(:one))
assert_equal "Confirmado pedido na loja do Sombra", mail.subject
assert_equal ["dave@example.org"], mail.to
assert_equal ["depot@example.com"], mail.from
assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
end
test "shipped" do
mail = OrderNotifier.shipped(orders(:one))
assert_equal "Pedido na loja do Sombra enviado", mail.subject
assert_equal ["dave@example.org"], mail.to
assert_equal ["depot@example.com"], mail.from
assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
mail.body.encoded
end
end
