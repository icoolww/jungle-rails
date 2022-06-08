
   
describe('Home Page', () => {

  it('Navigates visitor to home page', () => {
    cy.visit("http://localhost:3000/").should("exist");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 12 products on the page", () => {
    cy.get(".products article").should("have.length", 12);
  });
  

});