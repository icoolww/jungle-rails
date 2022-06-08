
   
describe('Product Page', () => {

  it('Navigates visitor to product page', () => {
    cy.visit("http://localhost:3000/products#index").should("exist");
  });



  // it("There is products on the page", () => {
  //   cy.get(".products article").should("be.visible");
  // });


  

});