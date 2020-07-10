//
//  main.swift
//  MiniProject2
//
//  Created by Agamenon Rocha Dos Santos on 06/07/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation



var board = Board.init(size: 8)
solveQueens(board: &board, findFirst: true)
//board.place(row: 0, col: 0)
//print(board.description)
//board.remove(row: 0, col: 0)
//print(board.description)
