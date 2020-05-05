//
//  PresentationContent.swift
//  Yana
//
//  Created by Anderson Alencar on 30/04/20.
//  Copyright © 2020 Pedro Sousa. All rights reserved.
//

import Foundation

struct PresentationContent {
    let titles = ["Porque amamos muito", "Seja super", "A força da nossa união"]
    let descriptions = ["Tudo fica em segundo plano quando se trata de manter a saúde dos nossos filhos. Agora seus cuidados são guiados sem medo, estresse ou cansaço",
 "É preciso enfrentar os momentos mais difícies para conseguir viver os momentos mais importantes com quem amamos, aqui vocês não são apenas pais, são heroínas !",
"Aqui vocês está segura para compartilhar suas dificuldades, não se deixe abalar, juntos enfrentamos qualquer desafio !"]
    let imagePresentation = ["care1", "care2", "care3"]

    func getContent(index: Int) -> (title: String, description: String, imageName: String) {
        let content = (titles[index], descriptions[index], imagePresentation[index])
        return content
    }
}
