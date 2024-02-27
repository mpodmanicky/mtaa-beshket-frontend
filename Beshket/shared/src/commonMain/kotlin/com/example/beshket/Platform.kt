package com.example.beshket

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform