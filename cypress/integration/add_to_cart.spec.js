

describe('Add to Cart Page', () => {

  // need to be fixed
  it('adds items to cart', () => {
    cy.visit("http://localhost:3000/")
    cy.contains("My Cart (0)").should("exist")
    cy.get("add_item_cart_path(product_id: product.id)").click()
    cy.contains("My Cart (1)").should("exist");
  });



});