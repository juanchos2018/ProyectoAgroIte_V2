<template>

<div>
       <div class="instagram-box">
               <Carousel></Carousel>
           </div>
        <footer>
        <div class="footer-main">
         
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-top-box">
                            <h3>Horario de Atención:</h3>
                            <ul class="list-time">
                                <li>Lunes - Friday: 08.00am a 05.00pm</li>
                                <li>Viernes: 08.00am a 05.00pm</li>
                                <li>Sabado: <span>Cerrado</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-top-box">
                            <h3>Boletín</h3>
                            <form class="newsletter-box">
                                <div class="form-group">
                                    <input class="" type="email" name="Email" placeholder="Direccion de Correo Electrónico*" />
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <button class="btn hvr-hover" type="submit">Enviar</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-top-box">
                            <h3>Redes Sociales</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <ul>
                                <li><a href="https://www.facebook.com/IteCreceUnida/"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="https://twitter.com/IteMuni"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>Acerca de Nosotros</h4>
                            <p>AgroIte será el mercado online como empresa productora, comercializado y agroexportador en el rubro Agroindustrial, permitiendo a los agricultores de ITE tener la posibilidad de expandir sus ventas a nuevos mercados además de mejorar sus condiciones de vida al vender a precios más justos, sin intermediarios.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link">
                            <h4>Información</h4>
                            <ul>
                                <li><a href="#">Acerca de Nosotros</a></li>
                                <li><a href="#">Atencion al Cliente</a></li>
                                <li><a href="#">Nuestro Aplicacion</a></li>
                                <li><a href="#">Terminos &amp; Condiciones</a></li>
                                <li><a href="#">Politica de Privacidad</a></li>
                                <li><a href="#">Información de Entrega</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><i class="fas fa-map-marker-alt"></i>Dirección:<br>Tienda Agropecuaria: Pampa Alta s/n,<br>  s/n </p>
                                </li>
                                <li>
                                    <p><i class="fas fa-phone-square"></i>Teléfono: <a href="tel:+51-920830727">+51-920830727</a></p>
                                </li>
                                <li>
                                    <p><i class="fas fa-envelope"></i>Correo Electrónico: <a href="mesadepartes@muniite.gob.pe">contactinfo@gmail.com</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
     
</template>

<script>
import Carousel from "@/components/carousel/Carousel"
export default {
      name: 'footer',
      components: {Carousel}
}
</script>
<style src="./fotter.css"   />
